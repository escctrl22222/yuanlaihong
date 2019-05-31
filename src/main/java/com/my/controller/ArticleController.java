package com.my.controller;

import com.my.domain.Article;
import com.my.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
 * @create 2019-05-24-16:32
 */
@Controller
@RequestMapping("article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @RequestMapping("init")
    @ResponseBody
    public Map<String, Object> articleInit(Article article){

        Map<String, Object> map = new HashMap<>();
        List<Article> articles = articleService.selectAllArticle(article);

        map.put("articles", articles);
        return map;
    }
}
