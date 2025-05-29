<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($pageTitle) ?></title>
    <meta name="description" content="<?= htmlspecialchars($metaDescription) ?>">
    <meta name="keywords" content="<?= htmlspecialchars($metaKeywords) ?>">
	<link id="theme-style" rel="stylesheet" href="/templates/<?= htmlspecialchars($templ) ?>/css/minimal.css">
</head>
<body>
    <header>
        <div class="container header-content">
            <h1 class="blog-title">Мой IT Блог</h1>
            <p class="blog-subtitle">Заметки системного администратора</p>
            <span class="tag">networking • security • automation</span>
        </div>
    </header>
    
    <main class="container">
        <div class="main-grid">
            <div class="content-area">