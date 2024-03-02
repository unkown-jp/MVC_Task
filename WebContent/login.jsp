<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Objects"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.function.Function"%>
<%@ page import="skillcheck.bean.ResponseBean"%>
<%@ page import="skillcheck.bean.EmployeeBean"%>
<%@ page import="skillcheck.logger.Logger"%>

<%
    //リクエストより社員番号を取得: 関数型インターフェース（ラムダ式）
    Function<HttpServletRequest, Object[]> rmdGetResponseInfo = (rmdRequest) -> {
        // request: responseBean
        ResponseBean rb = (ResponseBean) request.getAttribute("responseBean");
        int requestStatus = 0;
        String message = "";
        String empId = "";
        if (Objects.nonNull(rb)) {
            requestStatus = rb.getRequestStaus();
            message = rb.getMessage();
            EmployeeBean emp = rb.getEmplyeeBeanList().stream().findFirst().orElse(null);
            if (Objects.nonNull(emp)) empId = emp.getEmpId();
        }
        return new Object[]{requestStatus, message, empId};
    };

    ResponseBean responseBean = null;
    // エラーメッセージ表示用
    String message = "";
    int requestStatus = 0;
    String empId = "";

    try {
        if (Objects.isNull(session) || session.isNew()) {
            Logger.log(new Throwable(), "セッションなし");
            Object[] objects = rmdGetResponseInfo.apply(request);
            requestStatus = (int) objects[0];
            message = (String) objects[1];
            empId = (String) objects[2];
        } else {
            Logger.log(new Throwable(), "セッションあり");
            // session: redirect
            final String redirect = (String) session.getAttribute("redirect");
            if (Objects.nonNull(redirect)) {
                Logger.log(new Throwable(), "redirect = " + redirect);
                message = redirect;
                session.invalidate();
            }

            if (requestStatus < 2 && message.isEmpty()) {
                // ログインエラー時
                ResponseBean rb = (ResponseBean) session.getAttribute("responseBean");
                if (Objects.nonNull(rb)) {
                    requestStatus = rb.getRequestStaus();
                    message = rb.getMessage();
                    EmployeeBean emp = rb.getEmplyeeBeanList().stream().findFirst().orElse(null);
                    if (Objects.nonNull(emp)) {
                        empId = emp.getEmpId();
                    }
                }
            }
            Logger.log(new Throwable(), "message = " + message);
        }
    } catch (Exception e) {
        Logger.log(new Throwable(), e);
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- FIXME Step-6-1: login.jspに適用するcssファイルのリンクタグを記述しなさい。-->
<!-- Tips: common.css、login.cssの2つを適用 ※適用するcssファイルのパスの書き方に注意　-->
[ここへ記述]
[ここへ記述]
<title>ログイン</title>
</head>
<body>
    <input id="hiddenDialog" type="hidden" value="<%=requestStatus == 2 ? message : ""%>"></input>
    <h2>ログイン</h2>
    <div class="div-login-form">
        <% if (requestStatus < 2 && !message.isEmpty()) { %>
            <!-- FIXME Step-6-2: 以下の手順に沿って適当な処理を記述しなさい。 -->
            <!-- 手順1. エラー（message）表示時に使用するlabelタグの準備-->
            <!-- 手順2. class属性と、適用するスタイルを準備したlabelタグに記述-->
            <!-- Tips: common.cssより赤色の文字色を定義しているスタイルを確認 -->
            [ここへ記述]
            <br>
        <% } %>
        <!-- FIXME Step-6-3: formタグのaction属性に送信先URIを記述しなさい。 -->
        <!-- Tips: web.xmlに記述されているservlet-nameを記述 -->
        <form action="[ここへ記述]" method="post">
            <div class="div-input-flex-area">
                <div>
                    <label>社員番号　: </label>
                    <input id="empId" type="text" name="empId" maxlength="5" value="<%=empId%>"><br>
                </div>
                <div>
                    <label>パスワード: </label>
                    <input id="password" type="password" name="password"><br>
                </div>
            </div>
            <div class="div-button-area">
                <input type="hidden" name="sender" value="/login.jsp"></input>
                <button id="btn-login" class="btn-login" name="requestType" value="login">ログイン</button>
            </div>
        </form>
    </div>
</body>
</html>