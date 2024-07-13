var toggleBtns = document.querySelectorAll('.js-formToggle');
var loginForm = document.querySelector('.panel_content:first-child'); // 获取登录表单
var registerForm = document.querySelector('.panel_content:last-child'); // 获取注册表单
var imagePanel = document.querySelector('.js-imageAnimate'); // 获取图片面板

// 初始化，将注册表单移动到登录表单的位置
registerForm.style.transform = 'translateX(0)';

for (var i = 0; i < toggleBtns.length; i++) {
    toggleBtns[i].addEventListener("click", function() {
        loginForm.classList.toggle('hidden'); // 切换登录表单的显示状态
        registerForm.classList.toggle('hidden'); // 切换注册表单的显示状态

        // 切换表单的动画效果
        if (!loginForm.classList.contains('hidden')) {
            loginForm.style.transition = 'transform 0.5s ease-in-out';
            loginForm.style.transform = 'translateX(0)';
            registerForm.style.transform = 'translateX(100%)';

            // 图片动画 - 返回初始状态
            imagePanel.classList.remove('animate');
            imagePanel.classList.add('animateOut');
        } else {
            registerForm.style.transition = 'transform 0.5s ease-in-out';
            registerForm.style.transform = 'translateX(0)';
            loginForm.style.transform = 'translateX(-100%)';

            // 图片动画 - 播放动画
            imagePanel.classList.remove('animateOut');
            imagePanel.classList.add('animate');
        }
    });
}