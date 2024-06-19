<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body class="shadow-lg p-3 mb-5 bg-body rounded container">

<form action="/nhan-vien/add" method="post">
    <div class="mb-3">
        <label class="form-label">Mã</label>
        <input type="text" class="form-control" name="ma"/>
        <div class="form-text text-danger">${err.ma}</div>
    </div>
    <div class="mb-3">
        <label class="form-label">họ </label>
        <input type="text" class="form-control" name="ho"/>
        <div class="form-text text-danger">${err.ho}</div>
    </div>
    <div class="mb-3">
        <label class="form-label">tên đệm </label>
        <input type="text" class="form-control" name="tenDem"/>
        <div class="form-text text-danger">${err.tenDem}</div>
    </div>
    <div class="mb-3">
        <label class="form-label">tên </label>
        <input type="text" class="form-control" name="ten"/>
        <div class="form-text text-danger">${err.ten}</div>
    </div>
    <div class="mb-3">
        <label class="form-label">Giới tính </label>
        <input type="radio" value="Nam" name="gioiTinh" checked/> nam
        <input type="radio" value="Nữ" name="gioiTinh"/> nữ
        <div class="form-text text-danger">${err.gioiTinh}</div>
    </div>
    <div class="mb-3">
        <label class="form-label">Ngày sinh</label>
        <input type="date" class="form-control" name="ngaySinh"/>
        <div class="form-text text-danger">${err.ngaySinh}</div>
    </div>
    <div class="mb-3">
        <label class="form-label">Mã chức vụ</label>
        <select name="chucVu">
            <c:forEach items="${listChucVu}" var="item">
                <option value="${item.id}">${item.ten}</option>
            </c:forEach>
        </select>
        <div class="form-text"></div>
    </div>
    <div class="mb-3">
        <label class="form-label">Cua hang</label>
        <select name="cuaHang">
            <c:forEach items="${listCuaHang}" var="item">
                <option value="${item.id}">${item.ten}</option>
            </c:forEach>
        </select>
        <div class="form-text"></div>
    </div>
    <button type="submit">
        add
    </button>
</form>

<table class="table" style="display: ${list.content.size()>0?"":"none"}">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">Mã</th>
        <th scope="col">Họ và tên</th>
        <th scope="col">Giới tính</th>
        <th scope="col">ngày sinh</th>
        <th scope="col">chức vụ</th>
        <th scope="col">Cửa hàng</th>
        <th scope="col">action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list.content}" varStatus="i" var="item">
        <tr>
            <td>${i.index+1}</td>
            <td>${item.ma}</td>
                <%--            <td>${item.ho+" "+ item.tenDem +" "+item.ten}</td>--%>
            <td>${item.ho} ${ item.tenDem} ${item.ten}</td>
            <td>${item.gioiTinh}</td>
            <td>${item.ngaySinh}</td>
            <td>${item.chucVu.ten }</td>
            <td>${item.cuaHang.ten }</td>
            <td>
                <a href="/nhan-vien/delete?id=${item.id}" class="btn btn-warning ">
                    xoa
                </a>
                <a href="/nhan-vien/view/update?id=${item.id}" class="btn btn-warning ">
                    update
                </a>
                <a href="" class="btn btn-warning ">
                    detail
                </a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<nav aria-label="Page navigation example" style="display: ${list.content.size()>0?"":"none"}">
    <ul class="pagination">
        <li class="page-item"><a class="page-link"
                                 href="/nhan-vien/hien-thi?currentPage=${list.number>0?list.number-1:list.number}">Previous</a>
        </li>
        <c:forEach var="item" begin="0" end="${list.totalPages-1<0?0:list.totalPages}" step="1">
            <li class="page-item"><a class="page-link" href="/nhan-vien/hien-thi?currentPage=${item}">${item+1}</a></li>
        </c:forEach>
        <li class="page-item"><a class="page-link"
                                 href="/nhan-vien/hien-thi?currentPage=${list.number<list.totalPages-1?list.number+1:list.number}">Next</a>
        </li>
    </ul>
</nav>
<h2 style="display: ${list.content.size()==0?"":"none"}" class="text-danger">Không còn bản ghi nào</h2>
<script>
</script>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>