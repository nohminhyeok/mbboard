<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Connect Dashboard</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/sunn-us/SUIT/fonts/static/stylesheet.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.5.2/css/all.min.css">
<style>
    :root {
        --main-bg: linear-gradient(120deg, #f3faff 80%, #e2f8fc 100%);
        --main-accent: #2476ff;
        --main-green: #13cf99;
        --main-font: 'SUIT', 'Pretendard', 'Malgun Gothic', sans-serif;
        --card-radius: 24px;
        --card-padding: 2.2rem 1.5rem 1.8rem 1.5rem;
        --shadow: 0 6px 32px #84bfff24, 0 1.5px 0 #13cf990c;
        --stat-bg: #f7fcfa;
        --stat-radius: 14px;
        --stat-padding: 1.2rem 1.2rem 1rem 1.2rem;
        --transition: background 0.3s, color 0.3s, box-shadow 0.3s;
    }
    html, body {
        min-height: 100vh;
        background: var(--main-bg);
        font-family: var(--main-font);
        color: #252c33;
        font-size: 16px;
        margin: 0;
        padding: 0;
        transition: var(--transition);
    }
    body {
        display: flex; flex-direction: column; align-items: center;
    }
    a, .toggle-mode, .toggle-card-btn {
        margin: 2.5rem 0 2.2rem 0;
        padding: 0.85rem 2.5rem;
        border-radius: 13px;
        background: linear-gradient(90deg, var(--main-accent) 60%, var(--main-green) 100%);
        color: #fff;
        font-weight: 700;
        text-decoration: none;
        box-shadow: 0 3px 16px #13cf9933;
        letter-spacing: 0.8px;
        transition: box-shadow .17s, filter .15s, background 0.2s, color 0.2s;
        font-size: 1.1rem;
        border: none;
        display: inline-block;
        outline: none;
        cursor: pointer;
    }
    a:focus, a:hover, .toggle-mode:focus, .toggle-mode:hover {
        filter: brightness(1.13) drop-shadow(0 2px 18px #0dcfad48);
        box-shadow: 0 6px 32px #13cf9960;
    }
    .toggle-mode {
        margin: 20px 0 16px 0;
        padding: 0.66rem 1.7rem;
        font-size: 1.05rem;
        background: linear-gradient(90deg, #333 70%, #777 120%);
        color: #fff;
        border-radius: 11px;
        float: right;
        margin-right: 2vw;
    }
    .dashboard {
        display: flex;
        gap: 2.5rem;
        width: 96vw;
        max-width: 1150px;
        margin: 0 0 3.2rem 0;
        flex-wrap: wrap;
        justify-content: center;
    }
    .card {
        background: #fff;
        border-radius: var(--card-radius);
        box-shadow: var(--shadow);
        padding: var(--card-padding);
        min-width: 270px;
        max-width: 350px;
        min-height: 200px;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        position: relative;
        transition: var(--transition), transform .15s;
        border: 1.5px solid #e1f2fb;
        overflow: hidden;
        margin-bottom: 20px;
    }
    .card:focus-within,
    .card:hover {
        box-shadow: 0 16px 44px #13cf9930, 0 1.5px 0 #0e97ea33;
        transform: translateY(-4px) scale(1.027);
        border-color: #92f9d3;
        z-index: 1;
    }
    .card h2 {
        font-size: 1.10rem;
        font-weight: 900;
        color: #0fa07e;
        letter-spacing: 1.1px;
        margin-bottom: 20px;
        margin-top: 0;
        z-index: 2;
        display: flex;
        align-items: center;
        gap: 10px;
    }
    .badge {
        background: #2476ff;
        color: #fff;
        border-radius: 11px;
        font-size: 0.81rem;
        padding: 4px 11px 4px 11px;
        font-weight: 800;
        margin-left: 9px;
        letter-spacing: 0.6px;
        box-shadow: 0 2px 10px #0db2ff28;
        vertical-align: middle;
        display: inline-block;
    }
    .badge-today { background: #13cf99; }
    .stats-row {
        display: flex;
        gap: 1.1rem;
        z-index: 2;
        width: 100%;
        justify-content: flex-start;
        flex-wrap: wrap;
    }
    .stat {
        background: var(--stat-bg);
        border-radius: var(--stat-radius);
        padding: var(--stat-padding);
        text-align: left;
        min-width: 95px; max-width: 170px;
        box-shadow: 0 1px 6px #13cf9932;
        border: 1.1px solid #e6faf5;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        position: relative;
        margin-bottom: 9px;
    }
    .stat i {
        font-size: 1.16rem;
        color: #38cfa6;
        margin-bottom: 2px;
    }
    .stat-title {
        font-size: 0.99rem;
        color: #7e8998;
        margin-bottom: 3px;
        font-weight: 700;
        display: flex;
        align-items: center;
        gap: 5px;
    }
    .stat-value {
        font-size: 2.0rem;
        font-weight: 900;
        color: #243444;
        letter-spacing: 1.3px;
        text-shadow: 0 1px 0 #fff, 0 3px 15px #1beccf21;
        transition: color 0.25s;
    }
    .card-server {
        background: linear-gradient(120deg, #13cf99 60%, #49aaff 120%);
        color: #fff;
        box-shadow: 0 11px 40px #00b78a30;
        border: none;
        min-width: 240px; max-width: 350px;
    }
    .card-server h2 {
        color: #fff;
        font-size: 1.04rem;
        margin-bottom: 18px;
        font-weight: 900;
        text-shadow: 0 1px 10px #1fddaa80;
    }
    .server-count {
        font-size: 2.1rem;
        font-weight: 900;
        letter-spacing: 2px;
        margin-top: 5px;
        margin-bottom: 3px;
        text-shadow: 0 2px 12px #005b4a3a;
        background: linear-gradient(90deg,#fff 15%, #b5ffe3 85%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        transition: color 0.25s;
    }
    .toggle-card-btn {
        float: right;
        margin-top: -7px;
        margin-bottom: 10px;
        padding: 0.28rem 1.15rem;
        background: #eee;
        color: #333;
        font-size: 0.92rem;
        border-radius: 8px;
        font-weight: 700;
        border: none;
        outline: none;
        cursor: pointer;
        box-shadow: 0 2px 7px #ccc2;
        transition: background 0.16s, color 0.18s;
    }
    .toggle-card-btn:hover {
        background: #13cf99;
        color: #fff;
    }
    /* 다크모드 */
    body.dark {
        background: linear-gradient(120deg, #10141b 80%, #1a2c38 100%);
        color: #dde2ea;
    }
    body.dark .card,
    body.dark .card-server {
        background: #232935 !important;
        color: #dde2ea;
        border-color: #202f3a;
        box-shadow: 0 7px 24px #0e2b46cc;
    }
    body.dark .card h2, body.dark .card-server h2 {
        color: #49ffe1;
        text-shadow: 0 1px 10px #2de7cb66;
    }
    body.dark .badge { background: #3258c8; }
    body.dark .badge-today { background: #0aebc2; }
    body.dark .stat { background: #1c222d; color: #fff; border-color: #22343e;}
    body.dark .stat-title { color: #68e4d7;}
    body.dark .stat-value, body.dark .server-count {
        color: #49ffe1 !important;
        text-shadow: 0 2px 12px #13cf9980;
        -webkit-text-fill-color: unset;
        background: unset;
    }
    body.dark .toggle-mode {
        background: linear-gradient(90deg, #404040 70%, #161d25 120%);
        color: #c2e7fc;
    }
    body.dark .toggle-card-btn {
        background: #22313f;
        color: #49ffe1;
        box-shadow: 0 2px 7px #0deed944;
    }
    /* 모바일/반응형 */
    @media (max-width: 900px) {
        .dashboard { gap: 1.5rem; width: 98vw; }
        .card, .card-server {
            max-width: 96vw; min-width: 190px;
            padding: 1.2rem 0.8rem 1.1rem 0.8rem;
            border-radius: 15px;
        }
        .stats-row { gap: 0.6rem; }
        .stat { min-width: 80px; max-width: 150px; font-size: 0.92rem; padding: 0.88rem 0.7rem 0.72rem 0.7rem;}
        .stat-value { font-size: 1.13rem;}
        .badge { padding: 3px 7px; font-size: 0.70rem; }
        .server-count { font-size: 1.2rem; }
    }
    @media (max-width: 600px) {
        a, .toggle-mode { padding: 0.62rem 1.5rem; font-size: 0.98rem; }
        .dashboard { flex-direction: column; gap: 1.2rem;}
        .card, .card-server { width: 96vw; min-width: 145px; border-radius: 11px; }
        .stat { min-width: 65px; max-width: 99vw; padding: 0.5rem 0.5rem;}
        .stat-value { font-size: 1.0rem;}
    }
</style>
</head>
<body>
    <button class="toggle-mode" id="modeBtn"><i class="fas fa-moon"></i> 다크모드</button>
    <a href="/login"><i class="fas fa-user-circle"></i> 로그인</a>
    <div class="dashboard">
        <div class="card" id="allCard" tabindex="0">
            <button class="toggle-card-btn" onclick="toggleCard('allCard')"><i class="fas fa-eye-slash"></i> 숨기기</button>
            <h2><i class="fas fa-chart-bar"></i> 전체 누적 <span class="badge">Total</span></h2>
            <div class="stats-row">
                <div class="stat">
                    <div class="stat-title"><i class="fas fa-user-secret"></i> ANONYMOUS</div>
                    <div class="stat-value" id="allAnonymous" aria-label="익명 접속">${connectCountMapAll.ANONYMOUS}</div>
                </div>
                <div class="stat">
                    <div class="stat-title"><i class="fas fa-user"></i> MEMBER</div>
                    <div class="stat-value" id="allMember" aria-label="회원 접속">${connectCountMapAll.MEMBER}</div>
                </div>
                <div class="stat">
                    <div class="stat-title"><i class="fas fa-user-shield"></i> ADMIN</div>
                    <div class="stat-value" id="allAdmin" aria-label="관리자 접속">${connectCountMapAll.ADMIN}</div>
                </div>
            </div>
        </div>
        <div class="card" id="todayCard" tabindex="0">
            <button class="toggle-card-btn" onclick="toggleCard('todayCard')"><i class="fas fa-eye-slash"></i> 숨기기</button>
            <h2><i class="fas fa-calendar-day"></i> 오늘 <span class="badge badge-today">Today</span></h2>
            <div class="stats-row">
                <div class="stat">
                    <div class="stat-title"><i class="fas fa-user-secret"></i> ANONYMOUS</div>
                    <div class="stat-value" id="todayAnonymous" aria-label="오늘 익명 접속">${connectCountMapToday.ANONYMOUS}</div>
                </div>
                <div class="stat">
                    <div class="stat-title"><i class="fas fa-user"></i> MEMBER</div>
                    <div class="stat-value" id="todayMember" aria-label="오늘 회원 접속">${connectCountMapToday.MEMBER}</div>
                </div>
                <div class="stat">
                    <div class="stat-title"><i class="fas fa-user-shield"></i> ADMIN</div>
                    <div class="stat-value" id="todayAdmin" aria-label="오늘 관리자 접속">${connectCountMapToday.ADMIN}</div>
                </div>
            </div>
        </div>
        <div class="card card-server" id="serverCard" tabindex="0">
            <button class="toggle-card-btn" onclick="toggleCard('serverCard')"><i class="fas fa-eye-slash"></i> 숨기기</button>
            <h2><i class="fas fa-plug"></i> 현재 서버 접속자 (세션)</h2>
            <div class="server-count" id="serverCount" aria-label="현재 접속자">${currentConnectCount}</div>
        </div>
    </div>
<script>
    // 다크모드 시스템 감지 & 토글
    const modeBtn = document.getElementById('modeBtn');
    function setDarkMode(dark) {
        if (dark) {
            document.body.classList.add('dark');
            modeBtn.innerHTML = '<i class="fas fa-sun"></i> 라이트모드';
        } else {
            document.body.classList.remove('dark');
            modeBtn.innerHTML = '<i class="fas fa-moon"></i> 다크모드';
        }
    }
    // 최초 자동 감지
    let darkMode = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches;
    setDarkMode(darkMode);

    modeBtn.onclick = () => {
        darkMode = !document.body.classList.contains('dark');
        setDarkMode(darkMode);
    }
    // 카드 숨김 토글
    function toggleCard(id) {
        const card = document.getElementById(id);
        if (!card) return;
        if (card.style.display !== "none") {
            card.style.display = "none";
        } else {
            card.style.display = "flex";
        }
    }
    // 숫자 애니메이션 (간단 구현)
    function animateValue(id, end) {
        const el = document.getElementById(id);
        if (!el) return;
        const start = 0;
        const duration = 600 + Math.random() * 800;
        let startTime = null;
        function animate(ts) {
            if (!startTime) startTime = ts;
            const progress = Math.min((ts - startTime) / duration, 1);
            const value = Math.floor(progress * (end - start) + start);
            el.textContent = value;
            if (progress < 1) requestAnimationFrame(animate);
            else el.textContent = end;
        }
        requestAnimationFrame(animate);
    }
    // JSP에서 숫자 가져와서 애니메이션 실행
    window.addEventListener("DOMContentLoaded", () => {
        try {
            animateValue("allAnonymous", parseInt(document.getElementById("allAnonymous").textContent) || 0);
            animateValue("allMember", parseInt(document.getElementById("allMember").textContent) || 0);
            animateValue("allAdmin", parseInt(document.getElementById("allAdmin").textContent) || 0);
            animateValue("todayAnonymous", parseInt(document.getElementById("todayAnonymous").textContent) || 0);
            animateValue("todayMember", parseInt(document.getElementById("todayMember").textContent) || 0);
            animateValue("todayAdmin", parseInt(document.getElementById("todayAdmin").textContent) || 0);
            animateValue("serverCount", parseInt(document.getElementById("serverCount").textContent) || 0);
        } catch(e){}
    });
</script>
</body>
</html>
