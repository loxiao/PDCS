package com.example.pdcs.servlet;

import javax.imageio.ImageIO;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

@WebServlet(name = "CaptchaServlet", value = "/CaptchaServlet")
public class CaptchaServlet extends HttpServlet {
    private int width = 100; // 假设宽度为200像素
    private int height = 25; // 假设高度为100像素
    private Random random = new Random();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置响应内容类型为JPEG图像
        response.setContentType("image/jpeg");

        // 创建缓冲图像
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g = image.createGraphics();

        // 设置背景颜色
        g.setColor(new Color(255, 255, 255));
        g.fillRect(0, 0, width, height);

        // 生成随机验证码
        String captchaText = generateRandomCaptcha();
        request.getSession().setAttribute("captcha1", captchaText); // 将验证码存入session

        // 绘制验证码到图像
        g.setFont(new Font("Arial", Font.BOLD, 25));
        g.setColor(new Color(0, 0, 0));
        g.drawString(captchaText, 19, 24);

        // 添加噪点和干扰线
        addNoise(g);

        // 输出图像到客户端
        OutputStream out = response.getOutputStream();
        ImageIO.write(image, "JPEG", out);
        out.close();
    }

    private String generateRandomCaptcha() {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random rnd = new Random();
        StringBuilder sb = new StringBuilder(4);
        for (int i = 0; i < 4; i++)
            sb.append(chars.charAt(rnd.nextInt(chars.length())));
        return sb.toString();
    }

    private void addNoise(Graphics2D g) {
        // 设置颜色为灰色，透明度较低，模拟噪点效果
        g.setColor(new Color(160, 160, 160, 100));

        // 添加噪点
        for (int i = 0; i < 100; i++) { // 根据需要调整噪点数量
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            g.drawRect(x, y, 1, 1); // 使用drawRect而不是fillRect可以创建更细小的点
        }

        // 添加干扰线
        for (int i = 0; i < 5; i++) { // 根据需要调整干扰线条数
            int x1 = random.nextInt(width);
            int y1 = random.nextInt(height);
            int x2 = random.nextInt(width);
            int y2 = random.nextInt(height);
            g.drawLine(x1, y1, x2, y2);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
