<?php include __DIR__ . '/header.tpl'; ?>

<?php if (isset($_GET['id'])): ?>
    <?php
        $newsId = (int)$_GET['id'];
        $newsItem = $news->getNewsById($newsId);
        $commentsList = $comments->getComments($newsId);
    ?>
    
    <?php if ($newsItem): ?>
        <article class="card">
            <?php if (isset($user) && $user['isadmin'] == 9): ?>
                <div class="admin-actions">
                    <a href="/admin/edit_news.php?id=<?= $newsItem['id'] ?>" class="edit-link">Редактировать</a>
                    <a href="/admin/delete_news.php?id=<?= $newsItem['id'] ?>" class="delete-link">Удалить</a>
                </div>
            <?php endif; ?>
            
            <h2><?= htmlspecialchars($newsItem['title']) ?></h2>
            <time datetime="<?= $newsItem['created_at'] ?>"><?= $newsItem['created_at'] ?></time>
            
            <div class="post-content">
                <?= $newsItem['content'] ?>
            </div>
            
            <a href="?" class="btn btn-outline">← Назад к списку</a>
        </article>
        
        <section class="card comments-section">
            <h3>Комментарии</h3>
            
            <?php if (empty($commentsList)): ?>
                <p class="no-comments">Пока нет комментариев. Будьте первым!</p>
            <?php else: ?>
                <div class="comments-list">
                    <?php foreach ($commentsList as $comment): ?>
                        <div class="comment">
                            <div class="comment-header">
                                <strong><?= htmlspecialchars($comment['user_name']) ?></strong>
                                <time><?= $comment['created_at'] ?></time>
                            </div>
                            <p><?= htmlspecialchars($comment['user_text']) ?></p>
                        </div>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>
            
            <form method="post" class="comment-form">
                <h4>Добавить комментарий</h4>
                
                <?php if (!isset($user['username'])): ?>
                    <div class="form-group">
                        <label for="user_name">Ваше имя</label>
                        <input type="text" id="user_name" name="user_name" required>
                    </div>
                <?php endif; ?>
                
                <div class="form-group">
                    <label for="user_text">Комментарий</label>
                    <textarea id="user_text" name="user_text" required></textarea>
                </div>
                
                <button type="submit" class="btn">Отправить</button>
            </form>
        </section>
    <?php else: ?>
        <?php
            header('HTTP/1.1 404 Not Found');
            include __DIR__ . '/404.tpl';
        ?>
    <?php endif; ?>
<?php else: ?>
    <?php if ($news): ?>
        <?php foreach ($news as $newsItem): ?>
            <article class="card post-preview">
                <?php if (isset($user) && $user['isadmin'] == 9): ?>
                    <div class="admin-actions">
                        <a href="/admin/edit_news.php?id=<?= $newsItem['id'] ?>" class="edit-link">Редактировать</a>
                        <a href="/admin/delete_news.php?id=<?= $newsItem['id'] ?>" class="delete-link">Удалить</a>
                    </div>
                <?php endif; ?>
                
                <h2><a href="?id=<?= $newsItem['id'] ?>"><?= htmlspecialchars($newsItem['title']) ?></a></h2>
                <time datetime="<?= $newsItem['created_at'] ?>"><?= $newsItem['created_at'] ?></time>
                
                <div class="post-excerpt">
                    <?= $newsItem['excerpt'] ?>...
                </div>
                
                <a href="?id=<?= $newsItem['id'] ?>" class="read-more">Читать дальше →</a>
            </article>
        <?php endforeach; ?>
    <?php else: ?>
        <div class="card">
            <p>Нет новостей для отображения</p>
        </div>
    <?php endif; ?>
<?php endif; ?>

<?php include __DIR__ . '/footer.tpl'; ?>