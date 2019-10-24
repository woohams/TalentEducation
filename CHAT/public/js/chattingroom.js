
let localStream;
let roomid;
let mirrorState = true;
const userid = document.getElementById('userId').value;
const isTutor = document.getElementById('isTutor').value == 'true';
const btns = document.getElementById('buttons');
const video = document.getElementById('video');
const startBtn = document.getElementById('btn-start');
const endBtn = document.getElementById('btn-end');
const cameraBtn = document.getElementById('btn-camera');
const micBtn = document.getElementById('btn-mic');
const sendBtn = document.getElementById('btn-send');
const mirrorBtn = document.getElementById('btn-mirror');
const userList = document.getElementById('userList');
const message = document.getElementById('message');
const chatMessages = document.getElementById('chatMessages');
const lectures = document.getElementById('lectures');
const content = document.getElementById('infomation');

// ......................................................
// .......................UI Code........................
// ......................................................

if (startBtn != null) {
    startBtn.onclick = () => {
        chatMessages.innerHTML = '';
        roomid = lectures.value;
        connection.open(roomid, (isRoomOpened, roomid, error) => {
            if (error) {
                console.log(error);
            }

            if (isRoomOpened === true) {
                console.log('Successfully created the room.', roomid);
                startBtn.disabled = true;
                endBtn.disabled = false;
                cameraBtn.disabled = false;
                micBtn.disabled = false;
                lectures.disabled = true;

                $.ajax({
                    url: '/startrecture',
                    method: 'post',
                    data: {roomid: roomid},
                    success: (msg) => {
                        if(msg.result > 0){
                            console.log('강의 시작');
                        } else {
                            console.log('강의 시작실패');
                        }

                        content.innerHTML = msg.content;
                    },
                    error: () => {
                        alert('통신실패');
                    }
                });
            }
        });
    };

    endBtn.onclick = () => {
        connection.getAllParticipants().forEach(function (pid) {
            connection.disconnectWith(pid);
        });

        connection.attachStreams.forEach(function (localStream) {
            localStream.stop();
        });

        connection.closeSocket();

        startBtn.disabled = false;
        endBtn.disabled = true;
        cameraBtn.disabled = true;
        micBtn.disabled = true;
        lectures.disabled = false;

        $.ajax({
            url: '/endrecture',
            method: 'post',
            data: {roomid: roomid},
            success: (msg) => {
                if(msg.result > 0){
                    console.log('강의 종료');
                } else {
                    console.log('강의 종료실패');
                }
            },
            error: () => {
                alert('통신실패');
            }
        });
    };

    cameraBtn.onclick = function () {
        const $this = $(this);
        $this.toggleClass('active');
        $this.hasClass('active') ? pauseVideo() : resumeVideo();
    };

    micBtn.onclick = function () {
        const $this = $(this);
        $this.toggleClass('active');
        $this.hasClass('active') ? muteAudio() : unmuteAudio();
    };

    mirrorBtn.onclick = () => {
        mirror(mirrorState);
        connection.send({
            mirrormode: true,
            state: mirrorState
        });
    }
}

function mirror(state){
    if(state){
        video.style.cssText = "-moz-transform: scale(-1, 1); \
                                -webkit-transform: scale(-1, 1); -o-transform: scale(-1, 1); \
                                transform: scale(-1, 1);";
        mirrorState = false;
    } else {
        video.style.cssText = "-moz-transform: scale(1, 1); \
                                -webkit-transform: scale(1, 1); -o-transform: scale(1, 1); \
                                transform: scale(1, 1);";
        mirrorState = true;
    }
}

// ......................................................
// ..................RTCMultiConnection Code.............
// ......................................................

const connection = new RTCMultiConnection();
connection.socketURL = '/';

connection.session = {
    audio: true,
    video: {
        mandatory: {
            maxFrameRate: 30
        },
        optional: [
            { googNoiseReduction: true },
            { facingMode: 'user' }
        ]
    },
    oneway: true,
    data: true
};

connection.sdpConstraints.mandatory = {
    OfferToReceiveAudio: false,
    OfferToReceiveVideo: false
};

connection.iceServers = [{
    'urls': [
        'stun:stun.l.google.com:19302',
        'stun:stun1.l.google.com:19302',
        'stun:stun2.l.google.com:19302',
        'stun:stun.l.google.com:19302?transport=udp',
    ]
}];

connection.videosContainer = document.getElementById('videoDiv');
connection.onstream = function (event) {
    event.mediaElement.removeAttribute('src');
    event.mediaElement.removeAttribute('srcObject');
    event.mediaElement.muted = true;
    event.mediaElement.volume = 0;

    try {
        video.setAttributeNode(document.createAttribute('autoplay'));
        video.setAttributeNode(document.createAttribute('playsinline'));
    } catch (e) {
        video.setAttribute('autoplay', true);
        video.setAttribute('playsinline', true);
    }

    if (event.type === 'local') {
        video.volume = 0;
        try {
            video.setAttributeNode(document.createAttribute('muted'));
        } catch (e) {
            video.setAttribute('muted', true);
        }
    }
    localStream = event.stream;
    video.srcObject = localStream;

    setTimeout(function () {
        video.play();
    }, 5000);
};

connection.onstreamended = function (event) {
    var mediaElement = video;
    if (mediaElement) {

        if (event.userid === connection.sessionid && !connection.isInitiator) {
            alert('Broadcast is ended. We will reload this page to clear the cache.');
            location.reload();
        }
    }
};

connection.onMediaError = function (e) {
    if (e.message === 'Concurrent mic process limit.') {
        if (DetectRTC.audioInputDevices.length <= 1) {
            alert('Please select external microphone. Check github issue number 483.');
            return;
        }

        var secondaryMic = DetectRTC.audioInputDevices[1].deviceId;
        connection.mediaConstraints.audio = {
            deviceId: secondaryMic
        };

        connection.join(connection.sessionid);
    }
};

connection.onUserStatusChanged = function (event) {
    if (isTutor === true) {
        let names = [];
        const dl = document.createElement('dl');
        connection.getAllParticipants().forEach(function (pid) {
            names.push(getFullName(pid));
        });
        if (!names.length) {
            names = ['Only You'];
        } else {
            names = [connection.extra.fullName || 'You'].concat(names);
        }
        names.forEach((fullName) => {
            const dd = document.createElement('dd');
            dd.innerHTML = fullName;
            dl.appendChild(dd);
        });
        userList.innerHTML = '';
        userList.appendChild(dl);

        connection.send({
            userList: true,
            names: names
        });
    }
};

connection.onleave = function (event) {
    if (connection.getAllParticipants().length > 1) {
        connection.send({
            leave: true,
            userid: event.extra.fullName,
            isTutor: false
        });
    } else {
        let leave = {
            data: {
                userid: event.extra.fullName,
                isTutor: true
            }
        }
        enter_leave(leave, 'leave');
    }
};

function getFullName(pid) {
    var _userFullName = pid;
    if (connection.peers[pid] && connection.peers[pid].extra.fullName) {
        _userFullName = connection.peers[pid].extra.fullName;
    }
    return _userFullName;
}

function initialize() {

    connection.extra = {
        fullName: userid
    };

    if (isTutor === true) {
        startBtn.disabled = false;
        endBtn.disabled = true;
        cameraBtn.disabled = true;
        micBtn.disabled = true;

    } else {
        roomid = document.getElementById('roomId').value;
        connection.sdpConstraints.mandatory = {
            OfferToReceiveAudio: true,
            OfferToReceiveVideo: true
        };

        connection.join(roomid);
        setTimeout(() => {
            connection.send({
                new: true,
                userid: userid,
                isTutor: isTutor
            });
        }, 500);
    }
}

// ......................................................
// ....................pause / play......................
// ......................................................

/**
 * 비디오 정지
 */
function pauseVideo() {
    localStream.getVideoTracks()[0].enabled = false;
    cameraBtn.innerHTML = 'Camera Resume';

}

/**
 * 비디오 정지 해제
 */
function resumeVideo() {
    localStream.getVideoTracks()[0].enabled = true;
    cameraBtn.innerHTML = 'Camera Pause';
}

/**
 * 오디오 정지
 */
function muteAudio() {
    localStream.getAudioTracks()[0].enabled = false;
    micBtn.innerHTML = 'Mic Unmute';
}

/**
 * 오디오 정지 해제
 */
function unmuteAudio() {
    localStream.getAudioTracks()[0].enabled = true;
    micBtn.innerHTML = 'Mic Mute';
}

// ......................................................
// .....................Chtting Code.....................
// ......................................................
sendBtn.onclick = sendMsg;
function sendMsg() {
    chatMsg = message.value.replace('\n', '<br/>');
    message.value = '';

    if (chatMsg.trim().length === 0) {
        return;
    }
    const sendData = {
        chatMessage: chatMsg.trim(),
        sender: userid,
        isTutor: isTutor
    };

    connection.send(sendData);
    if (isTutor == true) {
        appendMessage(sendData);
    }
    message.focus();
}

function enterkey() {
    if (window.event.keyCode == 13) {
        if (!event.shiftKey) {
            window.event.preventDefault();
            sendMsg();
        }
    }
}

connection.onmessage = (event) => {

    if (event.data.chatMessage) {
        appendMessage(event);

        if (event.data.isTutor != true) {
            event.data.isTutor = true;
            connection.send(event.data);
        }
    }

    if (event.data.new) {
        enter_leave(event, 'enter');
    }

    if (event.data.leave) {
        enter_leave(event, 'leave')
    }

    if (event.data.userList) {

        let names = event.data.names;
        const dl = document.createElement('dl');
        names.forEach((fullName) => {
            const dd = document.createElement('dd');
            dd.innerHTML = fullName;
            dl.appendChild(dd);
        });
        userList.innerHTML = '';
        userList.appendChild(dl);
        userList.scrollTop = userList.scrollHeight;
    }

    if(event.data.mirrormode){
        mirrorState = event.data.state;
        mirror(!mirrorState);
    }
}

function enter_leave(event, type) {
    const enter = '님이 입장하셨습니다.';
    const leave = '님이 퇴장하셨습니다.'
    if (event.data.userid != userid) {
        const dl = document.createElement('dl');
        const dd = document.createElement('dd');
        dl.className = 'messages';
        if (type === 'enter') {
            dd.innerHTML = event.data.userid + enter;
        } else {
            dd.innerHTML = event.data.userid + leave;
        }
        dl.appendChild(dd);
        chatMessages.appendChild(dl);
        chatMessages.scrollTop = chatMessages.scrollHeight;
    }

    if (event.data.isTutor != true) {
        event.data.isTutor = true;
        connection.send(event.data);
    }
}

function appendMessage(event) {
    const dl = document.createElement('dl');
    const dt = document.createElement('dt');
    const dd = document.createElement('dd');
    dl.className = 'messages';

    if (event.data) {
        dt.innerHTML = event.data.sender + ':';
        dd.innerHTML = event.data.chatMessage;

    } else {
        dt.innerHTML = event.sender + ':';
        dd.innerHTML = event.chatMessage;
    }

    dl.appendChild(dt);
    dl.appendChild(dd);
    chatMessages.appendChild(dl);

    chatMessages.scrollTop = chatMessages.scrollHeight;
}

$(() => {
    initialize();
})