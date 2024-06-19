<!doctype html>
<html lang="en"><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"

          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> <title>Document</title>
</head>

<body class="shadow-lg p-3 mb-5 bg-body rounded container">
<form action="/nhan-vien/update?id=${detail.id}" method="post">
    <div class="mb-3">
        <label class="form-label">Mã</label>
        <input type="text" class="form-control" name="ma" value="${detail.ma}"/>
        <div class="form-text text-danger">${err.ma}</div>
    </div>
    <div class="mb-3">
        <label class="form-label">họ </label>
        <input type="text" class="form-control" name="ho" value="${detail.ho}"/>
        <div class="form-text text-danger">${err.ho}</div>
    </div>
    <div class="mb-3">
        <label class="form-label">tên đệm </label>
        <input type="text" class="form-control" name="tenDem" value="${detail.tenDem}"/>
        <div class="form-text text-danger">${err.tenDem}</div>
    </div>
    <div class="mb-3">
        <label class="form-label">tên </label>
        <input type="text" class="form-control" name="ten" value="${detail.ten}"/>
        <div class="form-text text-danger">${err.ten}</div>
    </div>
    <div class="mb-3">
        <label class="form-label">Giới tính </label>
        <input type="radio" value="Nam" name="gioiTinh" ${detail.gioiTinh==Nam?"checked":""}/> nam
        <input type="radio" value="Nữ" name="gioiTinh" ${detail.gioiTinh==Nam?"":"checked"} /> nữ
        <div class="form-text text-danger">${err.gioiTinh}</div>
    </div>
    <div class="mb-3">
        <label class="form-label">Ngày sinh</label>
        <input type="date" class="form-control" name="ngaySinh" value="<fmt:formatDate value='${detail.ngaySinh}' pattern='yyyy-MM-dd'/>"/>
        <div class="form-text text-danger">${err.ngaySinh}</div>
    </div>
    <div class="mb-3">
        <label class="form-label">Mã chức vụ</label>
        <select name="chucVu">
            <c:forEach items="${listChucVu}" var="item">
                <option value="${item.id}" ${detail.chucVu.id==item.id?"selected":""}>${item.ten}</option>
            </c:forEach>
        </select>
        <div class="form-text"></div>
    </div>
    <div class="mb-3" >
        <label class="form-label">Cua hang</label>
        <select name="cuaHang">
            <c:forEach items="${listCuaHang}" var="item">
                <option value="${item.id}" ${detail.cuaHang.id==item.id?"selected":""}>${item.ten}</option>
            </c:forEach>
        </select>
        <div class="form-text"></div>
    </div>
    <button type="submit">
        update
    </button>
</form><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
               integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
               crossorigin="anonymous"></script>
</body>
</html>