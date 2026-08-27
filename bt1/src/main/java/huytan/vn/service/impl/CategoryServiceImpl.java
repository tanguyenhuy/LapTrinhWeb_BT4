package huytan.vn.service.impl;

import java.util.List;
import huytan.vn.dao.ICategoryDao;
import huytan.vn.dao.impl.CategoryDaoImpl;
import huytan.vn.entities.Category;
import huytan.vn.services.ICategoryService;

public class CategoryServiceImpl implements ICategoryService {
    private ICategoryDao cateDao = new CategoryDaoImpl();

    @Override
    public void insert(Category category) {
        Category cate = this.findByCategoryname(category.getCategoryname());
        if (cate == null) {
            cateDao.insert(category);
        }
    }

    @Override
    public void update(Category category) {
        Category cate = this.findById(category.getCategoryid());
        if (cate != null) {
            cateDao.update(category);
        }
    }

    @Override
    public void delete(int id) {
        try {
            cateDao.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Category findById(int id) {
        return cateDao.findById(id);
    }

    @Override
    public Category findByCategoryname(String name) {
        return cateDao.findByCategoryname(name);
    }

    @Override
    public List<Category> findAll() {
        return cateDao.findAll();
    }

    @Override
    public List<Category> findAll(int page, int pagesize) {
        return cateDao.findAll(page, pagesize);
    }

    @Override
    public List<Category> searchByName(String keyword) {
        return cateDao.searchByName(keyword);
    }

    @Override
    public int count() {
        return cateDao.count();
    }
}