package com.my.service;

import com.my.domain.Article;

import java.util.List;

/**
 * 类名称：
 * 类描述：
 *
 * @author DongXHL(今晓)
 * 单位：
 * 联系方式：QQ(415235631)
 * @create 2019-05-24-16:46
 */
public interface ArticleService {
    List<Article> selectAllArticle(Article article);
}
