package com.my.service.impl;

import com.my.dao.Dao;
import com.my.domain.Article;
import com.my.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 类名称：
 * 类描述：
 *
 * @author DongXHL(今晓)
 * 单位：
 * 联系方式：QQ(415235631)
 * @create 2019-05-24-16:52
 */
@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private Dao dao;
    @Override
    @SuppressWarnings("unchecked")
    public List<Article> selectAllArticle(Article article) {
        return (List<Article>) dao.selectForList("ArticleMapper.selectArticle",article);
    }
}
