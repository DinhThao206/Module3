<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<%@ taglib prefix="c"
           uri="jakarta.tags.core" %>

<html>

<head>

    <title>${story.title}</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/detail.css">

</head>

<body>

<div class="detail-container">

    <!-- THÔNG TIN TRUYỆN -->

    <div class="story-detail">

        <div class="story-cover">

            <img
                    src="${story.coverImage}"
                    alt="story">

        </div>

        <div class="story-content">

            <h1>

                ${story.title}

            </h1>

            <p>

                <strong>Author:</strong>
                ${story.author}

            </p>

            <p>

                <strong>Genre:</strong>
                ${story.genre}

            </p>

            <p>

                <strong>Chapter:</strong>
                ${story.chapterCount}

            </p>

            <p class="description">

                ${story.description}

            </p>

        </div>

    </div>

    <!-- DANH SÁCH CHAPTER -->

    <h2 class="chapter-title">

        Danh sách chapter

    </h2>

    <div class="chapter-scroll">

        <c:forEach
                var="chapter"
                items="${chapterList}">

            <div class="chapter-item">

                <a href="${pageContext.request.contextPath}/chapter?id=${chapter.id}">

                    <div>

                        <strong>

                            Chapter ${chapter.chapterNumber}

                        </strong>

                        -

                            ${chapter.title}

                    </div>

                    <div class="read-btn">

                        Đọc →

                    </div>

                </a>

            </div>

        </c:forEach>

    </div>

</div>

</body>

</html>