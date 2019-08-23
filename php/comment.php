<?php
session_start();

//导入数据库配置文件
include_once('db.php');
$con = new mysqli($db['server'], $db['user'], $db['pwd'], $db['database']);


if ($con->connect_error) {
    die("链接错误：" . $con->connect_error);
}


//登陆
if (isset($_GET['login'])) {
    //获取前端数据
    $username = $_GET['username'];
    $password = $_GET['password'];

    //查询用户是否正确
    $sql = "select * from `user` where username = '{$username}' && password ='{$password}'";

    $result = $con->query($sql);

    //$result->fetch_assoc()的值为查到的数组 Array ( [cid] => 1 [username] => 12 [password] => 1231 [utime] => )
    //

    if ($result->num_rows > 0) {
        $_SESSION['username'] = $result->fetch_assoc()['username'];
        echo 1;
    } else {
        echo 0;
    }

    //关闭数据库链接
    $con->close();
}



//注册
else if (isset($_GET['register'])) {
    //获取前端数据
    $username = $_GET['username'];
    $password = $_GET['password'];
    $usertime = $_GET['usertime'];

    //查询重复用户
    $sql = "select * from `user` where username = '{$username}'";

    $result = $con->query($sql);

    if ($result->num_rows == 0) { //没有重复

        // echo '=======分割线，添加用户数据====<br /><br />';

        $sql = "insert into `user` (username,password,utime) values('{$username}','{$password}','{$usertime}')";

        $con->query($sql);
    } else {    //有重复
        echo 0;
    }

    //关闭数据库链接
    $con->close();
}



//加载
else if (isset($_GET['comment'])) {

    // echo '=======分割线，查询用户数据====<br /><br />';

    $sql = "select * from comment order by time desc";

    $result = $con->query($sql);

    $userc = array();

    while ($row = $result->fetch_assoc()) {
        $userc[] = $row;
    }
    $userc[] = $_SESSION['username'];
    echo json_encode($userc);  //显示数据


    //关闭数据库链接
    $con->close();
}



//评论
else if (isset($_GET['insert'])) {
    //获取前端数据

    $username = $_GET['username'];
    $content = $_GET['content'];
    $datetime = $_GET['datetime'];

    //查询用户cid
    $sql = "select * from `user` where username = '{$username}'";

    $result = $con->query($sql);
    $uid = $result->fetch_assoc()['cid'];
    // echo '=======分割线，添加用户数据====<br /><br />';

    $sql = "insert into `comment` (uid,username,content,time) values('{$uid}','{$username}','{$content}','{$datetime}')";

    $con->query($sql);

    // echo '=======分割线，查询用户数据并排序（时间降序）====<br /><br />';

    $sql = "select * from comment order by time desc";

    $result = $con->query($sql);

    //显示数据

    $userc = array();
    while ($row = $result->fetch_assoc()) {
        $userc[] = $row;
    }
    $userc[] = $_SESSION['username'];
    echo json_encode($userc);


    //关闭数据库链接
    $con->close();
}



//删除
else if (isset($_GET['delete'])) {
    $cid = $_GET['cid'];
    // echo '=======分割线，添加用户数据====<br /><br />';

    $sql = "delete from `comment` where cid = {$cid}";

    $con->query($sql);

    // echo '=======分割线，查询用户数据====<br /><br />';

    $sql = "select * from comment order by time desc";

    $result = $con->query($sql);

    $userc = array();

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $userc[] = $row;
            // echo '<br />';
        }
        $userc[] = $_SESSION['username'];
        echo json_encode($userc);  //显示数据
    } else {
        echo 0;
    }

    //关闭数据库链接
    $con->close();
}


//删除
else if (isset($_GET['exit'])) {
    $_SESSION = array();
}
