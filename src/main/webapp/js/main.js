let toggleBtns = document.querySelectorAll('.js-formToggle');
let loginForm = document.querySelector('.panel_content:first-child'); // 获取登录表单
let registerForm = document.querySelector('.panel_content:last-child'); // 获取注册表单
let imagePanel = document.querySelector('.js-imageAnimate'); // 获取图片面板
// 初始化，将注册表单移动到登录表单的位置
registerForm.style.transform = 'translateX(0)';

for (var i = 0; i < toggleBtns.length; i++) {
    toggleBtns[i].addEventListener("click", function() {
        // 切换登录表单和注册表单的显示状态
        let isLoginVisible = !loginForm.classList.contains('hidden');
        loginForm.classList.toggle('hidden');
        registerForm.classList.toggle('hidden', !isLoginVisible); // 如果登录表单不可见，则注册表单可见

        // 切换表单的动画效果
        if (!isLoginVisible) { // 如果之前是注册表单可见
            loginForm.style.transition = 'transform 0.5s ease-in-out, opacity 0.5s ease-in-out';
            loginForm.style.transform = 'translateX(0)';
            loginForm.style.opacity = 1; // 假设你使用opacity来控制可见性
            registerForm.style.transform = 'translateX(100%)';
            registerForm.style.opacity = 0; // 隐藏注册表单

            // 图片动画 - 返回初始状态
            imagePanel.classList.remove('animate');
            imagePanel.classList.add('animateOut');
            imagePanel.style.left = '64px';
        } else { // 如果之前是登录表单可见
            registerForm.style.transition = 'transform 0.5s ease-in-out, opacity 0.5s ease-in-out';
            registerForm.style.transform = 'translateX(0)';
            registerForm.style.opacity = 1; // 显示注册表单
            loginForm.style.transform = 'translateX(-100%)';
            loginForm.style.opacity = 0; // 隐藏登录表单

            // 图片动画 - 播放动画
            imagePanel.classList.remove('animateOut');
            imagePanel.classList.add('animate');
            imagePanel.style.left = '0';
        }
    });
}