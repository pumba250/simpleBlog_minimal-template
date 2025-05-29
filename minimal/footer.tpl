            </div> <!-- end content-area -->
            
            <aside class="sidebar">
                <!-- User card -->
                <div class="card">
                    <?php if ($user): ?>
                        <div class="user-info">
                            <?php if (!empty($user['avatar'])): ?>
								<img src="<?= htmlspecialchars($user['avatar']) ?>" alt="User Avatar" class="user-avatar">
							<?php else: ?>
								<div class="default-avatar">
									<?= mb_substr(htmlspecialchars($user['username']), 0, 1, 'UTF-8') ?>
								</div>
							<?php endif; ?>
                            <h3>Привет, <?= htmlspecialchars($user['username']) ?>!</h3>
                            <form method="post" action="/admin/do_logout.php">
                                <button type="submit" class="btn btn-outline">Выйти</button>
                            </form>
                            <?php if ($user['isadmin']=='9'): ?>
                                <p><a href="/admin/" class="admin-link">Панель администратора</a></p>
                            <?php endif; ?>
                        </div>
                    <?php else: ?>
                        <div class="auth-buttons">
                            <button class="btn" id="loginBtn">Войти</button>
                            <a href="?action=register" class="btn btn-outline">Регистрация</a>
                        </div>
                    <?php endif; ?>
                    
                    <nav class="sidebar-nav">
                        <ul>
                            <li><a href="/">Главная</a></li>
                            <li><a href="?action=contact">Обратная связь</a></li>
                        </ul>
                    </nav>
                </div>
                
                <!-- Recent posts -->
                <div class="card">
                    <h3>Последние посты</h3>
                    <?php if ($lastThreeNews): ?>
                        <ul class="post-list">
                            <?php foreach ($lastThreeNews as $newsItem): ?>
                                <li>
                                    <a href="?id=<?= htmlspecialchars($newsItem['id']) ?>">
                                        <?= htmlspecialchars($newsItem['title']) ?>
                                    </a>
                                    <small><?= $newsItem['created_at'] ?></small>
                                </li>
                            <?php endforeach; ?>
                        </ul>
                    <?php else: ?>
                        <p>Нет новостей</p>
                    <?php endif; ?>
                </div>
                
                <!-- Tags cloud -->
                <div class="card">
                    <h3>Теги</h3>
                    <div class="tags-cloud">
                        <?php if ($allTags): ?>
                            <?php foreach ($allTags as $tag): ?>
                                <a href="?tags=<?= htmlspecialchars($tag['name']) ?>" class="tag">
                                    <?= htmlspecialchars($tag['name']) ?>
                                </a>
                            <?php endforeach; ?>
                        <?php else: ?>
                            <p>Нет тегов</p>
                        <?php endif; ?>
                    </div>
                </div>
            </aside>
        </div> <!-- end main-grid -->
        
        <!-- Pagination -->
        <div class="pagination">
            <?php if ($currentPage > 1): ?>
                <a href="?page=<?= $currentPage - 1 ?>" class="btn btn-outline">Предыдущая</a>
            <?php else: ?>
                <button class="btn btn-outline" disabled>Предыдущая</button>
            <?php endif; ?>
            
            <?php if ($currentPage < $totalPages): ?>
                <a href="?page=<?= $currentPage + 1 ?>" class="btn">Следующая</a>
            <?php else: ?>
                <button class="btn" disabled>Следующая</button>
            <?php endif; ?>
        </div>
    </main>
    
    <footer>
        <div class="container">
            <p>&copy; <?= date("Y") ?> <?= htmlspecialchars($_SERVER['SERVER_NAME']) ?>. Powered by <?= $powered ?>_<?= $version ?>. Все права защищены.</p>
        </div>
    </footer>
    
    <!-- Login Modal -->
    <div id="loginModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Вход в систему</h2>
            <form method="POST">
                <input type="hidden" name="action" value="login">
                
                <div class="form-group">
                    <label for="username">Имя пользователя</label>
                    <input type="text" id="username" name="username" required>
                </div>
                
                <div class="form-group">
                    <label for="password">Пароль</label>
                    <input type="password" id="password" name="password" required>
                </div>
                
                <div class="form-group">
                    <label>Сколько будет <img src="<?= $captcha_image_url ?>" alt="Капча"></label>
                    <input type="text" name="captcha" required placeholder="Введите ответ">
                </div>
                
                <div class="form-group">
                    <label>
                        <input type="checkbox" name="remember" checked> Запомнить меня
                    </label>
                </div>
                
                <button type="submit" class="btn">Войти</button>
            </form>
        </div>
    </div>
    
    <script>
        // Modal functionality
        const modal = document.getElementById('loginModal');
        const btn = document.getElementById('loginBtn');
        const span = document.getElementsByClassName('close')[0];
        
        btn.onclick = function() {
            modal.style.display = 'block';
        }
        
        span.onclick = function() {
            modal.style.display = 'none';
        }
        
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = 'none';
            }
        }
    </script>
</body>
</html>