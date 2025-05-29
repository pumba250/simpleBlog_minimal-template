<?php include __DIR__ . '/header.tpl'; 
session_start();
?>

<div class="card">
    <div class="contact-form">
        <h2>Свяжитесь с нами</h2>
        <p class="subtitle">Напишите, что нам стоит улучшить или просто оставьте отзыв о нас!</p>
        
        <?php if (!empty($errors[0])): ?>
            <div class="alert error">
                <?= $errors[0] ?>
            </div>
        <?php endif; ?>
        
        <form method="POST">
            <input type="hidden" name="action" value="contact">
            
            <div class="form-group">
                <label for="name">Имя</label>
                <input type="text" id="name" name="name" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="message">Сообщение</label>
                <textarea id="message" name="message" required></textarea>
            </div>
            
            <div class="form-group">
                <label>Сколько будет <img src="<?= $captcha_image_url ?>" alt="Капча"></label>
                <input type="text" name="captcha" required placeholder="Введите ответ">
            </div>
            
            <button type="submit" class="btn">Отправить</button>
        </form>
    </div>
</div>

<?php include __DIR__ . '/footer.tpl'; ?>