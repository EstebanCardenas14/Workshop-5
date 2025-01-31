<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>JSP Tutorial</title>
    <link rel="stylesheet" href="./CSS/css.css">

    <style>
        table, th, td {
            border: 1px solid black;
        }
    </style>
</head>
<body>

<br><br><br>
<h1>Biblioteca - Taller 5 <img src=./image/online-library.png width="40px" height="40px"></h1>
<p class="subtitulo">Grupo : Syntax Error</p>
<br><br><br>

<div class="button-st">
<button class="btn-start" onclick="location.href='./form-library.jsp';">Create library</button>
<button class="btn-start" onclick="location.href='./form-author.jsp';">Create author</button>
<button class="btn-start" onclick="location.href='./form-customer.jsp';">Create customer</button>
</div>
<div class="containerTablas">

<h3 class="subtitulos">Libraries</h3>

<table id="librariesTbl">
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Action</th>
        <th>Action</th>
        <th>Action</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    </tbody>
</table>

<h3 class="subtitulos">Authors</h3>

<table id="authorsTbl">
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Country</th>
        <th>#Books</th>
        <th>Action</th>
        <th>Action</th>
        <th>Action</th>
        <th>Action</th>

    </tr>
    </thead>
    <tbody>
    </tbody>
</table>
<h3 class="subtitulos">Customers</h3>

<table id="customersTbl">
    <thead>
    <tr>
        <th>Email</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Gender</th>
        <th>Age</th>
        <th>Action</th>
        <th>Action</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    </tbody>
</table>
<script>

    function printTable(elementId, servlet, columns, actions = []) {

        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4) {
                var data = JSON.parse(xhr.responseText);
                var tbodyRef = document.getElementById(elementId).getElementsByTagName('tbody')[0];
                data.map(d => {
                    var newRow = tbodyRef.insertRow();
                    columns.map(c => {
                        var cell = newRow.insertCell();
                        var text = document.createTextNode(d[c]);
                        cell.appendChild(text);
                    });
                    if (actions.includes('create-book')) {
                        var cell = newRow.insertCell();
                        var action = document.createElement('button');
                        action.setAttribute('onclick', 'location.href="./form-book.jsp?authorId=' + d['authorId'] + '";');
                        var text = document.createTextNode('Create book');
                        action.appendChild(text);
                        cell.appendChild(action);
                    }

                    if (actions.includes('delete-author')) {
                        var cell = newRow.insertCell();
                        var action = document.createElement('button');
                        action.onclick = function() {
                            alert("Para eliminar un autor, antes desasocia, sus libros de la librería si es el caso.");
                            location.href='./delete-author?authorId='+d['authorId'];
                        };
                        var text = document.createTextNode('Delete author');
                        action.appendChild(text);
                        cell.appendChild(action);
                    }
                    if (actions.includes('edit-author')) {
                        var cell = newRow.insertCell();
                        var action = document.createElement('button');
                        action.setAttribute('onclick', 'location.href="./edit-author.jsp?authorId=' + d['authorId'] + '";');
                        var text = document.createTextNode('Edit author');
                        action.appendChild(text);
                        cell.appendChild(action);
                    }

                    if (actions.includes('view-books')) {
                        var cell = newRow.insertCell();
                        var action = document.createElement('button');
                        action.setAttribute('onclick', 'location.href="./view-book.jsp?authorId=' + d['authorId']+ '";');
                        var text = document.createTextNode('View book');
                        action.appendChild(text);
                        cell.appendChild(action);
                    }


                    if (actions.includes('delete-customer')) {
                        var cell = newRow.insertCell();
                        var action = document.createElement('button');
                        action.setAttribute('onclick', 'location.href="./delete-customer?email=' + d['email'] + '";');
                        var text = document.createTextNode('Delete customer');
                        action.appendChild(text);
                        cell.appendChild(action);
                    }

                    if (actions.includes('edit-customer')) {
                        var cell = newRow.insertCell();
                        var action = document.createElement('button');
                        action.setAttribute('onclick', 'location.href="./edit-customer.jsp?libraryId=' + d['libraryId'] + '";');
                        var text = document.createTextNode('Edit Customer');
                        action.appendChild(text);
                        cell.appendChild(action);

                    }

                    if (actions.includes('create-rent')) {
                        var cell = newRow.insertCell();
                        var action = document.createElement('button');
                        action.setAttribute('onclick', 'location.href="./form-rent.jsp?libraryId=' + d['libraryId'] + '";');
                        var text = document.createTextNode('Create Rent');
                        action.appendChild(text);
                        cell.appendChild(action);

                    }


                    if (actions.includes('delete-library')) {
                        var cell = newRow.insertCell();
                        var action = document.createElement('button');
                        action.setAttribute('onclick', 'location.href="./delete-Library?libraryId=' + d['libraryId'] + '";');
                        var text = document.createTextNode('Delete Library');
                        action.appendChild(text);
                        cell.appendChild(action);
                    }

                    if (actions.includes('edit-library')) {
                        var cell = newRow.insertCell();
                        var action = document.createElement('button');
                        action.setAttribute('onclick', 'location.href="./edit-library.jsp?libraryId=' + d['libraryId'] + '";');
                        var text = document.createTextNode('Edit Library');
                        action.appendChild(text);
                        cell.appendChild(action);

                    }
                    if (actions.includes('associate-edition')) {
                        var cell = newRow.insertCell();
                        var action = document.createElement('button');
                        var LibraryID = d['libraryId'];
                        action.setAttribute('onclick', 'location.href="./asso-library.jsp?libraryId=' + LibraryID +'&assosingLibIntro=true'+ '";');
                        var text = document.createTextNode('Associate');
                        action.appendChild(text);
                        cell.appendChild(action);

                    }
                    if (actions.includes('disassociate-edition')) {
                        var cell = newRow.insertCell();
                        var action = document.createElement('button');
                        var LibraryID = d['libraryId'];
                        action.setAttribute('onclick', 'location.href="./asso-library.jsp?libraryId=' + LibraryID +'&aso=true'+'";');
                        var text = document.createTextNode('Disassociate');
                        action.appendChild(text);
                        cell.appendChild(action);

                    }


                });
            }
        }
        xhr.open('GET', '${pageContext.request.contextPath}/' + servlet, true);
        xhr.send(null);
    }
    // Printing libraries
    printTable(elementId = 'librariesTbl', servlet = 'list-libraries', columns = ['libraryId', 'name'], actions = ['delete-library', 'edit-library','associate-edition','disassociate-edition']);
    // Printing authors
    printTable(elementId = 'authorsTbl', servlet = 'list-authors', columns = ['authorId', 'name', 'country', 'numBooks'], actions = ['create-book','edit-author' ,'delete-author','view-books']);
    // Printing customer
    printTable(elementId = 'customersTbl', servlet = 'list-customers', columns = ['email', 'first_name', 'last_name', 'gender','age'], actions = ['create-rent','edit-customer' ,'delete-customer']);
</script>
</div>

</body>
</html>