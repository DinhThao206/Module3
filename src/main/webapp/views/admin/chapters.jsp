
<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<%@ taglib prefix="c"
           uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html>

<head>

    <title>

        Quản lý Chapter

    </title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/admin.css">

</head>

<body>

<div class="admin-container">

    <div class="page-header">

        <h1>

            Quản lý Chapter

        </h1>

        <a href="${pageContext.request.contextPath}/admin/upload-chapter"
           class="add-chapter-btn">

            + Upload Chapter

        </a>

    </div>

    <div class="chapter-table-wrapper">

        <table class="chapter-table">

            <thead>

            <tr>

                <th>ID</th>

                <th>Story ID</th>

                <th>Chapter</th>

                <th>Title</th>

                <th>Action</th>

            </tr>

            </thead>

            <tbody>

            <c:forEach var="chapter"
                       items="${chapterList}">

                <tr>

                    <td>

                            ${chapter.id}

                    </td>

                    <td>

                            ${chapter.storyId}

                    </td>

                    <td>

                        Chapter ${chapter.chapterNumber}

                    </td>

                    <td>

                            ${chapter.title}

                    </td>

                    <td>

                        <div class="action-buttons">

                            <a href="${pageContext.request.contextPath}/admin/edit-chapter?id=${chapter.id}"
                               class="edit-btn">

                                Edit

                            </a>

                            <a href="${pageContext.request.contextPath}/admin/delete-chapter?id=${chapter.id}"
                               class="delete-btn"
                               onclick="return confirm('Xóa chapter này?')">

                                Delete

                            </a>

                        </div>

                    </td>

                </tr>

            </c:forEach>

            </tbody>

        </table>

    </div>

</div>

</body>

</html>
