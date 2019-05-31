package com.my.controller;

import com.my.domain.Article;
import com.my.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 类名称：
 * 类描述：
 *
 * @author DongXHL(今晓)
 * 单位：
 * 联系方式：QQ(415235631)
 * @create 2019-05-25-17:28
 */
@Controller
@RequestMapping("/blog")
public class BlogController {

    @Autowired
    private ArticleService articleService;

    /**
     * 跳转至全部文章页面
     * @return
     */
    @RequestMapping("/allArticle")
    public ModelAndView allArticle(){
        ModelAndView model = new ModelAndView();
        model.setViewName("blog/allArticle");
        return model;
    }

    /**
     * 站内搜索功能
     */
    @RequestMapping("/search")
    public Map<String,Object> blogSearch(HttpServletRequest request, HttpServletResponse response){

        Map<String,Object> resMap = new HashMap<>();
        List<Article> resArticles = new ArrayList<>();
       // byte[] bt = new byte[8192];
        String str = request.getParameter("str");
        StringBuffer requestURL = request.getRequestURL();
        String projectUrl = requestURL.substring(0,requestURL.indexOf("yuanlaihong")) + "yuanlaihong/";

        List<Article> articles = articleService.selectAllArticle(new Article());
        for (Article article:articles
             ) {
            try {
                URL url = new URL(projectUrl);
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                connection.connect();
                InputStream urlStream = connection.getInputStream();
                Reader reader = new InputStreamReader(urlStream);
                char[] htmlFileStr = new char[(urlStream.read())];
                reader.read(htmlFileStr);
                if(htmlFileStr.toString().contains(str)){
                    resArticles.add(article);
                }
            } catch (MalformedURLException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
            //File htmlFile = new File(projectUrl + article.getUrl());
//            if(!htmlFile.exists()){
//                continue;
//            }
//            try {
//                Reader reader = new FileReader(htmlFile);
//                char[] htmlFileStr = new char[(int) htmlFile.length()];
//                reader.read(htmlFileStr);
//                System.out.println(htmlFileStr);
//                if(htmlFileStr.toString().contains(str)){
//                    resArticles.add(article);
//                }
//
//            } catch (FileNotFoundException e) {
//                e.printStackTrace();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
//        resMap.put("articles", resArticles);
        return resMap;

    }
}
