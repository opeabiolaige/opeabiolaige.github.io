<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Ope Abiola-Ige | Counselor · Author · Wellness Coach</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500&family=Jost:wght@300;400;500;600&display=swap" rel="stylesheet" />

  <style>
    /* ─── TOKENS ─── */
    :root {
      --sage:       #8fa882;
      --sage-light: #c8d8c1;
      --sage-bg:    #eef3eb;
      --cream:      #faf7f2;
      --warm-white: #f5f0e8;
      --gold:       #b4924a;
      --gold-light: #d4b06a;
      --navy:       #1c2b3a;
      --charcoal:   #2e3d35;
      --muted:      #6b7e71;
      --border:     #dce8d5;
      --radius-sm:  8px;
      --radius-md:  18px;
      --radius-lg:  40px;
      --radius-pill:999px;
      --font-display: 'Cormorant Garamond', Georgia, serif;
      --font-body:    'Jost', sans-serif;
      --shadow-soft: 0 8px 40px rgba(28,43,58,.07);
      --shadow-card: 0 4px 24px rgba(28,43,58,.09);
    }

    /* ─── RESET ─── */
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
    html { scroll-behavior: smooth; }
    body {
      font-family: var(--font-body);
      background: var(--cream);
      color: var(--navy);
      line-height: 1.65;
      overflow-x: hidden;
    }
    img { display: block; max-width: 100%; }
    a { text-decoration: none; color: inherit; }

    /* ─── SCROLLBAR ─── */
    ::-webkit-scrollbar { width: 6px; }
    ::-webkit-scrollbar-track { background: var(--cream); }
    ::-webkit-scrollbar-thumb { background: var(--sage); border-radius: 3px; }

    /* ─── UTILITY ─── */
    .container {
      width: min(1100px, 92%);
      margin: 0 auto;
    }
    .tag {
      font-family: var(--font-body);
      font-size: .7rem;
      font-weight: 600;
      letter-spacing: .18em;
      text-transform: uppercase;
      color: var(--sage);
    }
    .serif { font-family: var(--font-display); }
    .gold  { color: var(--gold); }

    /* ─── NAV ─── */
    nav {
      position: fixed;
      top: 0; left: 0; right: 0;
      z-index: 100;
      background: rgba(250,247,242,.92);
      backdrop-filter: blur(12px);
      border-bottom: 1px solid var(--border);
      padding: 0 5%;
      height: 68px;
      display: flex;
      align-items: center;
      justify-content: space-between;
    }
    .nav-logo {
      font-family: var(--font-display);
      font-size: 1.25rem;
      font-weight: 600;
      color: var(--charcoal);
      letter-spacing: .02em;
    }
    .nav-logo span { color: var(--gold); }
    .nav-links {
      display: flex;
      gap: 2.5rem;
      list-style: none;
    }
    .nav-links a {
      font-size: .8rem;
      font-weight: 500;
      letter-spacing: .1em;
      text-transform: uppercase;
      color: var(--muted);
      transition: color .25s;
    }
    .nav-links a:hover { color: var(--gold); }
    .nav-cta {
      background: var(--gold);
      color: #fff !important;
      padding: .45rem 1.2rem;
      border-radius: var(--radius-pill);
      font-size: .75rem !important;
      letter-spacing: .1em;
      transition: background .25s !important;
    }
    .nav-cta:hover { background: var(--charcoal) !important; }

    /* hamburger */
    .hamburger {
      display: none;
      flex-direction: column;
      gap: 5px;
      cursor: pointer;
      background: none;
      border: none;
      padding: 4px;
    }
    .hamburger span {
      display: block;
      width: 24px;
      height: 2px;
      background: var(--charcoal);
      border-radius: 2px;
      transition: .3s;
    }
    .mobile-menu {
      display: none;
      position: fixed;
      top: 68px; left: 0; right: 0;
      background: var(--cream);
      border-bottom: 1px solid var(--border);
      padding: 1.5rem 5%;
      z-index: 99;
      flex-direction: column;
      gap: 1.2rem;
    }
    .mobile-menu.open { display: flex; }
    .mobile-menu a {
      font-size: .85rem;
      font-weight: 500;
      letter-spacing: .1em;
      text-transform: uppercase;
      color: var(--muted);
    }

    /* ─── HERO ─── */
    #hero {
      min-height: 100svh;
      padding-top: 68px;
      background: var(--sage-bg);
      display: grid;
      grid-template-columns: 1fr 1fr;
      align-items: center;
      gap: 4rem;
      position: relative;
      overflow: hidden;
    }
    #hero::before {
      content: '';
      position: absolute;
      top: -120px; right: -120px;
      width: 560px; height: 560px;
      border-radius: 50%;
      background: radial-gradient(circle, rgba(180,146,74,.13) 0%, transparent 70%);
      pointer-events: none;
    }
    .hero-text {
      padding: 6rem 0 6rem 8%;
      animation: fadeUp .9s ease both;
    }
    .hero-tag {
      display: inline-flex;
      align-items: center;
      gap: .6rem;
      background: rgba(143,168,130,.18);
      border: 1px solid var(--sage-light);
      border-radius: var(--radius-pill);
      padding: .35rem 1rem;
      margin-bottom: 2rem;
    }
    .hero-tag::before {
      content: '';
      width: 6px; height: 6px;
      background: var(--sage);
      border-radius: 50%;
    }
    h1 {
      font-family: var(--font-display);
      font-size: clamp(3rem, 5vw, 5rem);
      font-weight: 500;
      line-height: 1.08;
      color: var(--charcoal);
      margin-bottom: 1.5rem;
    }
    h1 em {
      font-style: italic;
      color: var(--gold);
    }
    .hero-sub {
      font-size: 1rem;
      color: var(--muted);
      max-width: 420px;
      margin-bottom: 2.5rem;
      font-weight: 300;
      line-height: 1.8;
    }
    .hero-btns {
      display: flex;
      flex-wrap: wrap;
      gap: .9rem;
    }
    .btn-primary {
      background: var(--charcoal);
      color: #fff;
      padding: .85rem 2rem;
      border-radius: var(--radius-pill);
      font-size: .8rem;
      font-weight: 500;
      letter-spacing: .1em;
      text-transform: uppercase;
      transition: background .25s, transform .2s;
      border: 2px solid var(--charcoal);
    }
    .btn-primary:hover { background: var(--gold); border-color: var(--gold); transform: translateY(-2px); }
    .btn-outline {
      background: transparent;
      color: var(--charcoal);
      padding: .85rem 2rem;
      border-radius: var(--radius-pill);
      font-size: .8rem;
      font-weight: 500;
      letter-spacing: .1em;
      text-transform: uppercase;
      border: 2px solid var(--charcoal);
      transition: background .25s, color .25s, transform .2s;
    }
    .btn-outline:hover { background: var(--charcoal); color: #fff; transform: translateY(-2px); }

    .hero-stats {
      display: flex;
      gap: 2.5rem;
      margin-top: 3rem;
      padding-top: 2rem;
      border-top: 1px solid var(--border);
    }
    .stat-num {
      font-family: var(--font-display);
      font-size: 2rem;
      font-weight: 600;
      color: var(--gold);
      line-height: 1;
    }
    .stat-lbl {
      font-size: .72rem;
      font-weight: 500;
      letter-spacing: .08em;
      text-transform: uppercase;
      color: var(--muted);
      margin-top: .3rem;
    }

    /* hero image side */
    .hero-visual {
      position: relative;
      height: 100%;
      display: flex;
      align-items: flex-end;
      justify-content: center;
      padding-bottom: 4rem;
      padding-right: 6%;
    }
    .hero-img-wrap {
      position: relative;
      width: 100%;
      max-width: 460px;
    }
    .hero-img-bg {
      width: 100%;
      aspect-ratio: 3/4;
      background: linear-gradient(145deg, var(--sage-light) 0%, var(--sage) 100%);
      border-radius: 200px 200px 160px 160px;
      position: relative;
      overflow: hidden;
    }
    /* placeholder silhouette */
    .hero-img-bg::after {
      content: 'Your photo here';
      position: absolute;
      inset: 0;
      display: flex;
      align-items: center;
      justify-content: center;
      font-family: var(--font-display);
      font-size: 1.1rem;
      font-style: italic;
      color: rgba(255,255,255,.6);
      letter-spacing: .05em;
    }
    .hero-badge {
      position: absolute;
      bottom: 2rem;
      left: -2rem;
      background: #fff;
      border-radius: var(--radius-md);
      padding: 1rem 1.3rem;
      box-shadow: var(--shadow-card);
      display: flex;
      align-items: center;
      gap: .8rem;
      animation: fadeUp 1.1s .4s ease both;
    }
    .badge-icon {
      width: 42px; height: 42px;
      background: var(--sage-bg);
      border-radius: var(--radius-sm);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.3rem;
    }
    .badge-label {
      font-size: .78rem;
      font-weight: 600;
      color: var(--charcoal);
      line-height: 1.3;
    }
    .badge-sub {
      font-size: .68rem;
      color: var(--muted);
    }

    /* ─── SECTION SHARED ─── */
    section { padding: 6rem 0; }
    .section-header {
      text-align: center;
      margin-bottom: 4rem;
    }
    .section-header .tag { margin-bottom: .8rem; display: block; }
    h2 {
      font-family: var(--font-display);
      font-size: clamp(2.2rem, 4vw, 3.2rem);
      font-weight: 500;
      line-height: 1.15;
      color: var(--charcoal);
    }
    h2 em { font-style: italic; color: var(--gold); }
    .section-lead {
      font-size: .98rem;
      color: var(--muted);
      max-width: 500px;
      margin: 1rem auto 0;
      line-height: 1.8;
    }

    /* ─── ABOUT ─── */
    #about { background: var(--cream); }
    .about-grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 5rem;
      align-items: center;
    }
    .about-img-col { position: relative; }
    .about-img-frame {
      width: 100%;
      aspect-ratio: 4/5;
      background: linear-gradient(160deg, var(--warm-white) 0%, var(--sage-bg) 100%);
      border-radius: 160px 160px 120px 120px;
      position: relative;
      overflow: hidden;
      border: 3px solid var(--border);
    }
    .about-img-frame::after {
      content: 'Your photo here';
      position: absolute;
      inset: 0;
      display: flex;
      align-items: center;
      justify-content: center;
      font-family: var(--font-display);
      font-style: italic;
      font-size: 1rem;
      color: var(--muted);
    }
    .about-decor {
      position: absolute;
      top: -20px; right: -20px;
      width: 120px; height: 120px;
      border: 2px solid var(--gold-light);
      border-radius: 50%;
      opacity: .4;
    }
    .about-text .tag { margin-bottom: 1rem; display: block; }
    .about-text h2 { text-align: left; margin-bottom: 1.5rem; }
    .about-text p {
      font-size: .97rem;
      color: var(--muted);
      line-height: 1.9;
      margin-bottom: 1.2rem;
    }
    .about-pills {
      display: flex;
      flex-wrap: wrap;
      gap: .6rem;
      margin: 1.8rem 0;
    }
    .pill {
      background: var(--sage-bg);
      border: 1px solid var(--sage-light);
      color: var(--charcoal);
      padding: .4rem 1rem;
      border-radius: var(--radius-pill);
      font-size: .78rem;
      font-weight: 500;
      letter-spacing: .04em;
    }

    /* ─── WORK / OFFERS ─── */
    #work { background: var(--sage-bg); }
    .work-grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 1.5rem;
    }
    .work-card {
      background: #fff;
      border-radius: var(--radius-md);
      padding: 2.2rem 1.8rem;
      box-shadow: var(--shadow-card);
      border: 1px solid var(--border);
      position: relative;
      overflow: hidden;
      transition: transform .3s, box-shadow .3s;
    }
    .work-card:hover {
      transform: translateY(-6px);
      box-shadow: 0 16px 48px rgba(28,43,58,.13);
    }
    .work-card.featured {
      background: var(--charcoal);
      color: #fff;
      border-color: var(--charcoal);
    }
    .work-card.featured .work-tag,
    .work-card.featured p,
    .work-card.featured h3 { color: rgba(255,255,255,.85); }
    .work-card.featured h3 { color: #fff; }
    .work-card.featured .work-link { color: var(--gold-light); }
    .work-num {
      font-family: var(--font-display);
      font-size: 3.5rem;
      font-weight: 600;
      color: var(--sage-light);
      line-height: 1;
      margin-bottom: .5rem;
    }
    .work-card.featured .work-num { color: rgba(255,255,255,.12); }
    .work-tag { font-size: .7rem; font-weight: 600; letter-spacing: .15em; text-transform: uppercase; color: var(--sage); margin-bottom: .8rem; }
    .work-card h3 {
      font-family: var(--font-display);
      font-size: 1.55rem;
      font-weight: 500;
      color: var(--charcoal);
      margin-bottom: .8rem;
      line-height: 1.2;
    }
    .work-card p {
      font-size: .88rem;
      color: var(--muted);
      line-height: 1.8;
      margin-bottom: 1.5rem;
    }
    .work-link {
      font-size: .78rem;
      font-weight: 600;
      letter-spacing: .08em;
      text-transform: uppercase;
      color: var(--gold);
      display: inline-flex;
      align-items: center;
      gap: .4rem;
      transition: gap .2s;
    }
    .work-link:hover { gap: .8rem; }
    .work-link::after { content: '→'; }

    /* ─── BOOK BANNER ─── */
    #book {
      background: var(--charcoal);
      padding: 5rem 0;
      overflow: hidden;
      position: relative;
    }
    #book::before {
      content: '';
      position: absolute;
      top: -80px; left: -80px;
      width: 400px; height: 400px;
      border-radius: 50%;
      background: radial-gradient(circle, rgba(180,146,74,.2) 0%, transparent 70%);
    }
    .book-inner {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 4rem;
      align-items: center;
    }
    .book-text .tag { color: var(--gold-light); margin-bottom: 1rem; display: block; }
    .book-text h2 { color: #fff; text-align: left; margin-bottom: 1.2rem; }
    .book-text p {
      color: rgba(255,255,255,.65);
      font-size: .97rem;
      line-height: 1.8;
      margin-bottom: 2rem;
    }
    .book-mockup {
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .book-cover {
      width: 220px;
      aspect-ratio: 6/9;
      background: linear-gradient(145deg, var(--sage) 0%, var(--sage-light) 100%);
      border-radius: 4px 12px 12px 4px;
      box-shadow: 12px 12px 0 0 rgba(180,146,74,.35), -4px 0 0 0 rgba(0,0,0,.15);
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      padding: 2rem;
      text-align: center;
      position: relative;
      overflow: hidden;
    }
    .book-cover::before {
      content: '';
      position: absolute;
      top: 0; left: 0;
      width: 6px; height: 100%;
      background: rgba(0,0,0,.15);
    }
    .book-title {
      font-family: var(--font-display);
      font-size: 1.3rem;
      font-weight: 600;
      font-style: italic;
      color: var(--charcoal);
      line-height: 1.2;
      margin-top: 1rem;
    }
    .book-author {
      font-size: .72rem;
      letter-spacing: .12em;
      text-transform: uppercase;
      color: var(--charcoal);
      margin-top: 1rem;
      font-weight: 600;
    }
    .book-leaf {
      font-size: 3rem;
      margin-bottom: .5rem;
    }

    /* ─── TESTIMONIALS ─── */
    #testimonials { background: var(--cream); }
    .testi-grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 1.5rem;
    }
    .testi-card {
      background: var(--warm-white);
      border: 1px solid var(--border);
      border-radius: var(--radius-md);
      padding: 2rem;
      position: relative;
    }
    .testi-card::before {
      content: '\201C';
      font-family: var(--font-display);
      font-size: 5rem;
      color: var(--sage-light);
      line-height: .8;
      position: absolute;
      top: 1rem; left: 1.5rem;
    }
    .testi-body {
      font-family: var(--font-display);
      font-size: 1.1rem;
      font-style: italic;
      line-height: 1.7;
      color: var(--charcoal);
      margin-top: 2rem;
      margin-bottom: 1.5rem;
    }
    .testi-name {
      font-size: .78rem;
      font-weight: 600;
      letter-spacing: .08em;
      text-transform: uppercase;
      color: var(--gold);
    }
    .testi-role {
      font-size: .75rem;
      color: var(--muted);
      margin-top: .2rem;
    }

    /* ─── CONTACT ─── */
    #contact { background: var(--sage-bg); }
    .contact-wrap {
      max-width: 700px;
      margin: 0 auto;
      text-align: center;
    }
    .contact-wrap h2 { margin-bottom: 1rem; }
    .contact-wrap p {
      font-size: .97rem;
      color: var(--muted);
      line-height: 1.8;
      margin-bottom: 2.5rem;
    }
    .contact-cards {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 1rem;
      margin-bottom: 2.5rem;
    }
    .contact-card {
      background: #fff;
      border: 1px solid var(--border);
      border-radius: var(--radius-md);
      padding: 1.5rem 1rem;
      text-align: center;
      transition: transform .25s, box-shadow .25s;
    }
    .contact-card:hover { transform: translateY(-4px); box-shadow: var(--shadow-card); }
    .contact-icon { font-size: 1.6rem; margin-bottom: .6rem; }
    .contact-label {
      font-size: .68rem;
      font-weight: 600;
      letter-spacing: .12em;
      text-transform: uppercase;
      color: var(--muted);
      margin-bottom: .3rem;
    }
    .contact-val {
      font-size: .88rem;
      font-weight: 500;
      color: var(--charcoal);
      word-break: break-all;
    }
    .social-row {
      display: flex;
      justify-content: center;
      gap: 1rem;
      flex-wrap: wrap;
    }
    .social-btn {
      display: inline-flex;
      align-items: center;
      gap: .5rem;
      background: var(--charcoal);
      color: #fff;
      padding: .7rem 1.4rem;
      border-radius: var(--radius-pill);
      font-size: .78rem;
      font-weight: 500;
      letter-spacing: .06em;
      transition: background .25s, transform .2s;
    }
    .social-btn:hover { background: var(--gold); transform: translateY(-2px); }
    .social-btn svg { width: 16px; height: 16px; fill: currentColor; }

    /* ─── FOOTER ─── */
    footer {
      background: var(--charcoal);
      color: rgba(255,255,255,.55);
      text-align: center;
      padding: 2rem;
      font-size: .78rem;
      letter-spacing: .04em;
    }
    footer span { color: var(--gold-light); }

    /* ─── ANIMATIONS ─── */
    @keyframes fadeUp {
      from { opacity: 0; transform: translateY(28px); }
      to   { opacity: 1; transform: translateY(0); }
    }
    .reveal {
      opacity: 0;
      transform: translateY(30px);
      transition: opacity .7s ease, transform .7s ease;
    }
    .reveal.visible {
      opacity: 1;
      transform: none;
    }

    /* ─── RESPONSIVE ─── */
    @media (max-width: 900px) {
      #hero { grid-template-columns: 1fr; min-height: auto; padding-bottom: 4rem; }
      .hero-text { padding: 4rem 5% 2rem; text-align: center; }
      .hero-sub { margin: 0 auto 2rem; }
      .hero-btns { justify-content: center; }
      .hero-stats { justify-content: center; }
      .hero-visual { display: none; }

      .about-grid { grid-template-columns: 1fr; gap: 3rem; }
      .about-img-col { max-width: 360px; margin: 0 auto; }

      .work-grid { grid-template-columns: 1fr; }
      .book-inner { grid-template-columns: 1fr; text-align: center; }
      .book-text h2 { text-align: center; }
      .testi-grid { grid-template-columns: 1fr; }
      .contact-cards { grid-template-columns: 1fr; }

      .nav-links { display: none; }
      .hamburger { display: flex; }
    }

    @media (max-width: 600px) {
      section { padding: 4rem 0; }
      h1 { font-size: 2.6rem; }
      h2 { font-size: 2rem; }
    }
  </style>
</head>
<body>

  <!-- ── NAV ── -->
  <nav>
    <a href="#hero" class="nav-logo">Ope<span>.</span></a>
    <ul class="nav-links">
      <li><a href="#about">About</a></li>
      <li><a href="#work">Work</a></li>
      <li><a href="#book">Book</a></li>
      <li><a href="#testimonials">Kind Words</a></li>
      <li><a href="#contact" class="nav-cta">Connect</a></li>
    </ul>
    <button class="hamburger" onclick="toggleMenu()" aria-label="Menu">
      <span></span><span></span><span></span>
    </button>
  </nav>

  <div class="mobile-menu" id="mobileMenu">
    <a href="#about"        onclick="closeMenu()">About</a>
    <a href="#work"         onclick="closeMenu()">Work</a>
    <a href="#book"         onclick="closeMenu()">Book</a>
    <a href="#testimonials" onclick="closeMenu()">Kind Words</a>
    <a href="#contact"      onclick="closeMenu()">Connect</a>
  </div>

  <!-- ── HERO ── -->
  <section id="hero">
    <div class="hero-text">
      <div class="hero-tag tag">Professional Counselor · Author · Wellness Coach</div>
      <h1>
        Helping you find your way<br/>back to <em>wholeness.</em>
      </h1>
      <p class="hero-sub">
        I'm Ope Abiola-Ige — a licensed counselor, wellness coach, and author dedicated
        to creating spaces where healing, identity, and restoration become possible.
      </p>
      <div class="hero-btns">
        <a href="#work"    class="btn-primary">Explore My Work</a>
        <a href="#contact" class="btn-outline">Let's Connect</a>
      </div>
      <div class="hero-stats">
        <div>
          <div class="stat-num">10+</div>
          <div class="stat-lbl">Years in Practice</div>
        </div>
        <div>
          <div class="stat-num">500+</div>
          <div class="stat-lbl">Lives Impacted</div>
        </div>
        <div>
          <div class="stat-num">3</div>
          <div class="stat-lbl">Core Pillars</div>
        </div>
      </div>
    </div>

    <div class="hero-visual">
      <div class="hero-img-wrap">
        <div class="hero-img-bg"></div>
        <div class="hero-badge">
          <div class="badge-icon">🌿</div>
          <div>
            <div class="badge-label">WholeSpace Wellness</div>
            <div class="badge-sub">Counseling · Coaching · Community</div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ── ABOUT ── -->
  <section id="about">
    <div class="container">
      <div class="about-grid">
        <div class="about-img-col reveal">
          <div class="about-img-frame"></div>
          <div class="about-decor"></div>
        </div>
        <div class="about-text reveal">
          <span class="tag">About Me</span>
          <h2>Where faith, healing,<br/>&amp; <em>wholeness</em> meet.</h2>
          <p>
            I'm a professional counselor, emotional wellness practitioner, and author
            based in Nigeria, with a heart set on serving women, families, and individuals
            who are ready to do the deep work of inner healing.
          </p>
          <p>
            Through my practice — <strong>WholeSpace Wellness</strong> — I create evidence-based,
            faith-integrated spaces where people can breathe, be honest, and begin again.
            Every session, every program, and every page I write is built around one
            conviction: you were made for wholeness.
          </p>
          <p>
            Beyond the therapy room, I'm a wife, a mother, a faith community leader,
            and a woman deeply in love with the Word. My work lives at the intersection
            of clinical excellence and spiritual depth.
          </p>
          <div class="about-pills">
            <span class="pill">Licensed Counselor</span>
            <span class="pill">Wellness Coach</span>
            <span class="pill">ACT Practitioner</span>
            <span class="pill">Author</span>
            <span class="pill">Faith Leader</span>
            <span class="pill">Speaker</span>
          </div>
          <a href="#contact" class="btn-primary">Work With Me</a>
        </div>
      </div>
    </div>
  </section>

  <!-- ── WORK / OFFERS ── -->
  <section id="work">
    <div class="container">
      <div class="section-header reveal">
        <span class="tag">What I Offer</span>
        <h2>Rooted in care.<br/><em>Built for transformation.</em></h2>
        <p class="section-lead">
          Whether you need one-on-one support, community healing, or a resource
          to guide your journey — there is a space here for you.
        </p>
      </div>
      <div class="work-grid">

        <div class="work-card reveal">
          <div class="work-num">01</div>
          <div class="work-tag">Individual &amp; Family</div>
          <h3>Counseling &amp; Therapy</h3>
          <p>
            Safe, confidential, evidence-based sessions for individuals, couples, and families
            navigating emotional pain, life transitions, grief, identity, and relational fractures.
          </p>
          <a href="#contact" class="work-link">Book a Session</a>
        </div>

        <div class="work-card featured reveal">
          <div class="work-num">02</div>
          <div class="work-tag">Group Program</div>
          <h3>The Healing Room</h3>
          <p>
            A virtual group wellness experience built on ACT — four sessions that
            walk you through Noticing, Naming, Defusing, and Committing. Community
            healing at an accessible price.
          </p>
          <a href="#contact" class="work-link">Join the Cohort</a>
        </div>

        <div class="work-card reveal">
          <div class="work-num">03</div>
          <div class="work-tag">Coaching</div>
          <h3>Emotional Wellness Coaching</h3>
          <p>
            Goal-oriented, structured coaching that helps you move from surviving to
            truly living — with clarity, emotional tools, and a compassionate guide by your side.
          </p>
          <a href="#contact" class="work-link">Let's Talk</a>
        </div>

      </div>
    </div>
  </section>

  <!-- ── BOOK ── -->
  <section id="book">
    <div class="container">
      <div class="book-inner">
        <div class="book-text reveal">
          <span class="tag">Coming Soon</span>
          <h2>The Journey<br/><em>to Wholeness</em></h2>
          <p>
            A deeply personal and spiritually grounded book on inner healing, identity,
            and restoration. Written for the woman who has been broken open and is
            ready to become whole — on her own terms, in God's timing.
          </p>
          <p>
            Part memoir, part roadmap, part invitation. This is the book I wish I had
            when I needed it most.
          </p>
          <a href="#contact" class="btn-primary" style="background:var(--gold);border-color:var(--gold);">
            Join the Waitlist
          </a>
        </div>
        <div class="book-mockup reveal">
          <div class="book-cover">
            <div class="book-leaf">🌿</div>
            <div class="book-title">The Journey to Wholeness</div>
            <div class="book-author">Ope Abiola-Ige</div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ── TESTIMONIALS ── -->
  <section id="testimonials">
    <div class="container">
      <div class="section-header reveal">
        <span class="tag">Kind Words</span>
        <h2>What people<br/>are <em>saying.</em></h2>
      </div>
      <div class="testi-grid">

        <div class="testi-card reveal">
          <p class="testi-body">
            "Working with Ope was one of the most transformative decisions I've
            made. She holds space in a way that feels completely safe — and
            then gently challenges you to grow beyond what you thought was possible."
          </p>
          <div class="testi-name">— [Client Name]</div>
          <div class="testi-role">Individual Counseling Client</div>
        </div>

        <div class="testi-card reveal">
          <p class="testi-body">
            "The Healing Room changed how I understand my own emotions. I came in
            feeling stuck and left with language, tools, and a real community
            of women walking the same road."
          </p>
          <div class="testi-name">— [Client Name]</div>
          <div class="testi-role">The Healing Room Participant</div>
        </div>

        <div class="testi-card reveal">
          <p class="testi-body">
            "Ope has a rare gift — the ability to weave clinical insight with
            genuine spiritual depth. Every session felt like being seen and
            guided at the same time. I'm a different woman."
          </p>
          <div class="testi-name">— [Client Name]</div>
          <div class="testi-role">Wellness Coaching Client</div>
        </div>

      </div>
    </div>
  </section>

  <!-- ── CONTACT ── -->
  <section id="contact">
    <div class="container">
      <div class="contact-wrap">
        <div class="section-header reveal">
          <span class="tag">Get In Touch</span>
          <h2>Ready to begin your<br/><em>journey to wholeness?</em></h2>
          <p>
            Whether you're seeking therapy, coaching, a speaking engagement, or just
            want to connect — I'd love to hear from you.
          </p>
        </div>

        <div class="contact-cards reveal">
          <a href="mailto:hello@opeabiolaige.com" class="contact-card">
            <div class="contact-icon">✉️</div>
            <div class="contact-label">Email</div>
            <div class="contact-val">hello@opeabiolaige.com</div>
          </a>
          <a href="https://opeabiolaige.com" class="contact-card" target="_blank">
            <div class="contact-icon">🌐</div>
            <div class="contact-label">Website</div>
            <div class="contact-val">opeabiolaige.com</div>
          </a>
          <a href="https://instagram.com/wholespace_" class="contact-card" target="_blank">
            <div class="contact-icon">📱</div>
            <div class="contact-label">Instagram</div>
            <div class="contact-val">@wholespace_</div>
          </a>
        </div>

        <div class="social-row reveal">
          <a href="https://instagram.com/wholespace_" class="social-btn" target="_blank">
            <svg viewBox="0 0 24 24"><path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/></svg>
            @wholespace_
          </a>
          <a href="https://instagram.com/opeabiolaige" class="social-btn" target="_blank"
             style="background:var(--sage);color:#fff;">
            <svg viewBox="0 0 24 24"><path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/></svg>
            @opeabiolaige
          </a>
        </div>
      </div>
    </div>
  </section>

  <!-- ── FOOTER ── -->
  <footer>
    <p>© 2025 <span>Ope Abiola-Ige</span> · opeabiolaige.com · All Rights Reserved</p>
  </footer>

  <!-- ── SCRIPTS ── -->
  <script>
    // mobile menu
    function toggleMenu() {
      document.getElementById('mobileMenu').classList.toggle('open');
    }
    function closeMenu() {
      document.getElementById('mobileMenu').classList.remove('open');
    }

    // scroll reveal
    const reveals = document.querySelectorAll('.reveal');
    const observer = new IntersectionObserver((entries) => {
      entries.forEach((e, i) => {
        if (e.isIntersecting) {
          e.target.style.transitionDelay = (i % 3) * 0.12 + 's';
          e.target.classList.add('visible');
          observer.unobserve(e.target);
        }
      });
    }, { threshold: 0.12 });
    reveals.forEach(el => observer.observe(el));
  </script>

</body>
</html>
