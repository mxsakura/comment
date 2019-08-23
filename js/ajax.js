function ajax(ajax_Json) {
  //   ajax_Json = {
  //     method: "",
  //     url: "",
  //     data: "",
  //     success: ""
  //   };

  //   创建XML对象;
  var xhr = new XMLHttpRequest();
  //   输入请求方式和请求地址
  if (ajax_Json.method == "get" && ajax_Json.data) {
    ajax_Json.url += "?" + ajax_Json.data;
  }
  xhr.open(ajax_Json.method, ajax_Json.url, true); //false会导致后面代码无法执行,一般都用true
  if (ajax_Json.method == "get") {
    xhr.send();
  } else {
    xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
    xhr.send(ajax_Json.data);
  }
  //   提交

  //得到反馈
  xhr.onreadystatechange = function() {
    if (xhr.readyState == 4) {
      //状态成功==4代表数据成功
      if (xhr.status == 200) {
        ajax_Json.success && ajax_Json.success(xhr.responseText);
      } else {
        alert("出错了,Err：" + xhr.status);
      }
    }
  };
}
