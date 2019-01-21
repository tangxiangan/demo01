package com.service.impl;


import com.dao.CommentDao;
import com.pojo.Book;
import com.pojo.Comment;
import com.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("CommentService")
public class CommentServiceImpl implements CommentService{
    @Autowired
    CommentDao commentDao;

    public List<Comment> find(Integer page,Integer size){
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("page",page);
        map.put("size",size);
        List<Comment> list=commentDao.find(map);
        return list;
    }

    public List<Comment> findHuiFu(Integer page,Integer size) {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("page",page);
        map.put("size",size);
        List<Comment> list=commentDao.findHuiFu(map);
        return list;
    }

    public int count(){
        int count=commentDao.count();
        return count;
    }

    public int countComment() {
        int count=commentDao.countComment();
        return count;
    }

    public int delete(int comment_id){
        int count=commentDao.delete(comment_id);
        return count;
    }

    public List<Comment> findOne(int cx_id,Integer page,Integer size) {
        Map<String,Object> map=new HashMap<String, Object>();
       map.put("cx_id",cx_id);
        map.put("page",page);
        map.put("size",size);
         List<Comment> list=commentDao.findOne(map);
        return list;
    }

    public List<Comment> findTwo(int cx_id,Integer page,Integer size) {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("cx_id",cx_id);
        map.put("page",page);
        map.put("size",size);
        List<Comment> list=commentDao.findTwo(map);
        return list;
    }

    public List<Comment> findComment_id(int comment_id) {
        List<Comment> list=commentDao.findComment_id(comment_id);
        return list;
    }

    public Book findBook_id(int book_id) {
        return commentDao.findBook_id(book_id);
    }

    public List<Comment> findBook(int book_id,Integer page,Integer size) {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("page",page);
        map.put("size",size);
        map.put("book_id",book_id);
        List<Comment> list=commentDao.findBook(map);
        return list;
    }

    public void add(Comment c) {
        commentDao.add(c);
    }

    public void dianZan(Comment c) {
        commentDao.dianZan(c);
    }

    public void update(Comment c) {
        commentDao.update(c);
    }

    public void huiFu(Comment c) {
        commentDao.huiFu(c);
    }

    public List<Comment> huiFuList(int book_id) {
        List<Comment> huiFuList=commentDao.huiFuList(book_id);
        return huiFuList;
    }

    public List<Comment> plList(int user_id) {
        List<Comment> plList=commentDao.plList(user_id);
        return plList;
    }
}
