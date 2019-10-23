function aa(a){
    const seqData = a.href.split('chattingroom/')[1]
    const form = document.getElementById('form');
    const userId = document.getElementsByName('userId')[0];
    const seq = document.getElementsByName('seq')[0];
    
    form.setAttribute('action', '/chattingroom');
    userId.value = prompt('아이디 입력');
    seq.value = seqData;
    form.submit();
}