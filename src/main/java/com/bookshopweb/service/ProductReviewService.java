package com.bookshopweb.service;

import com.bookshopweb.beans.ProductReview;
import com.bookshopweb.dao.ProductReviewDAO;

import java.util.List;

public class ProductReviewService extends Service<ProductReview, ProductReviewDAO> implements ProductReviewDAO {
    public ProductReviewService() {
        super(ProductReviewDAO.class);
    }

    @Override
    public List<ProductReview> getOrderedPartByProductId(int limit, int offset, String orderBy, String orderDir, long productId) {
        return jdbi.withExtension(ProductReviewDAO.class, dao -> dao.getOrderedPartByProductId(limit, offset, orderBy, orderDir, productId));
    }

    @Override
    public int countByProductId(long productId) {
        return jdbi.withExtension(ProductReviewDAO.class, dao -> dao.countByProductId(productId));
    }

    @Override
    public int sumRatingScoresByProductId(long productId) {
        return jdbi.withExtension(ProductReviewDAO.class, dao -> dao.sumRatingScoresByProductId(productId));
    }
}
