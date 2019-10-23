module.exports = (app, oracledb) => {
    const dbconfig = require('../dbconfig.js');

    app.get('/', (req, res) => {
        res.render('index');
    });

    app.get('/list', (req, res) => {
        oracledb.getConnection(dbconfig, (err, con) => {
            const query = 'select board_lecture_seq, board_lecture_title, tutor_id, tutees from board_lecture';

            con.execute(query, (err, result) => {

                if (err) {
                    console.error(err.message);

                    doRelease(con);
                    return;
                }

                doRelease(con, result.rows);

            });
        });

        function doRelease(con, roomlist) {
            con.close((err) => {
                if (err) {
                    console.error(err.message);
                }
                res.render('list', {
                    rooms: roomlist
                });
            })
        }
    });

    app.post('/createroom', (req, res) => {
        const userId = req.body.userId;

        oracledb.getConnection(dbconfig, (err, con) => {
            const query = ` select board_lecture_seq, board_lecture_title from board_lecture where tutor_id = :tutor_id `;
            let binddata = [userId];

            con.execute(query, binddata, (err, result) => {

                if (err) {
                    console.error(err.message);

                    doRelease(con);
                    return;
                }

                doRelease(con, result.rows);

            });
        });

        function doRelease(con, roomlist) {
            con.close((err) => {
                if (err) {
                    console.error(err.message);
                }
                let roomInfo = {
                    id: userId,
                    isTutor: '',
                    lectures: '',
                    content: ''
                };
                if (roomlist.length > 0) {
                    roomInfo.isTutor = true;
                    roomInfo.lectures = roomlist;
                } else {
                    res.redirect('/errorPage');
                }

                res.render('chattingroom', roomInfo);
            })
        }
    });

    app.post('/chattingroom', (req, res) => {
        const seq = req.body.seq;
        const userId = req.body.userId;
       
        oracledb.getConnection(dbconfig, (err, con) => {
            const query = ' select tutees, board_lecture_content from board_lecture where board_lecture_seq = :lecture_seq';
            const binddata = [seq];

            con.execute(query, binddata, (err, result) => {

                if (err) {
                    console.error(err.message);

                    doRelease(con);
                    return;
                }

                doRelease(con, result.rows);
            });
        });

        function doRelease(con, result) {
            con.close((err) => {
                if (err) {
                    console.error(err.message);
                }
                const tutees = result[0][0].split(',');
                let isTutees = false;

                tutees.some(element => {
                    if(element.trim() === userId){
                        isTutees = true;
                        return true;
                    }
                });
                if(isTutees){
                    let roomInfo = {
                        id: userId,
                        room: seq,
                        isTutor: false,
                        content: result[0][1]
                    };
                   
    
                    res.render('chattingroom', roomInfo);
                } else {
                    res.redirect('/errorPage');
                }
            });
        }

    });

    app.post('/startrecture', (req, res) => {
        const roomid = req.body.roomid;
        let content;

        oracledb.getConnection(dbconfig, (err, con) => {
            const query = ` update board_lecture set board_lecture_enable = 'Y' where board_lecture_seq = :roomid `;
            const selectQuery = ` select board_lecture_content from board_lecture where board_lecture_seq = :roomid `;
            const binddata = [roomid];

            con.execute(selectQuery, binddata, (err, result) => {

                if (err) {
                    console.error(err.message);

                    return;
                } else {
                    content = result.rows[0][0];
                }
            });

            con.execute(query, binddata, (err, result) => {

                if (err) {
                    console.error(err.message);

                    doRelease(con);
                    return;
                }
                doRelease(con, result.rowsAffected);
            });
        });

        function doRelease(con, result) {
            con.close((err) => {
                if (err) {
                    console.error(err.message);
                }

                res.send({
                    result: result,
                    content: content
                });
            });
        }
    });

    app.post('/endrecture', (req, res) => {
        const roomid = req.body.roomid;

        oracledb.getConnection(dbconfig, (err, con) => {
            const query = ` update board_lecture set board_lecture_enable = 'N' where board_lecture_seq = :roomid`;
            const binddata = [roomid];

            con.execute(query, binddata, (err, result) => {

                if (err) {
                    console.error(err.message);

                    doRelease(con);
                    return;
                }
                doRelease(con, result.rowsAffected);
            });
        });

        function doRelease(con, result) {
            con.close((err) => {
                if (err) {
                    console.error(err.message);
                }

                res.send({result: result});
            });
        }
    });

    app.get('/createroom', (req, res) => {
        res.render('errorPage');
    });

    app.get('/chatthingroom', (req, res) => {
        res.render('errorPage');
    });

    app.get('/errorPage', (req, res) => {
        res.render('errorPage');
    });
};