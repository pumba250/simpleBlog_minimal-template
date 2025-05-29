<?php include __DIR__ . '/header.tpl'; 
session_start();
?>

<div class="card">
    <div class="auth-form">
        <?php if (!$user): ?>
            <h2>Регистрация</h2>
            <?php flash(); ?>
            
            <form method="POST">
                <input type="hidden" name="action" value="register">
                
                <div class="form-group">
                    <label for="username">Логин</label>
                    <input type="text" id="username" name="username" required>
                </div>
                
                <div class="form-group">
                    <label for="password">Пароль</label>
                    <input type="password" id="password" name="password" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required>
                </div>
                
                <div class="form-group">
                    <label>Сколько будет <img src="<?= $captcha_image_url ?>" alt="Капча"></label>
                    <input type="text" name="captcha" required placeholder="Введите ответ">
                </div>
                
                <button type="submit" class="btn">Зарегистрироваться</button>
            </form>
            
            <div class="auth-links">
                Уже есть аккаунт? <a href="?action=login">Войти</a>
            </div>
        <?php else: ?>
            <div class="auth-success">
                <p>Вы уже вошли в систему как <?= htmlspecialchars($user['username']) ?></p>
                <a href="/" class="btn">На главную</a>
            </div>
        <?php endif; ?>
    </div>
</div>

<?php include __DIR__ . '/footer.tpl'; ?>