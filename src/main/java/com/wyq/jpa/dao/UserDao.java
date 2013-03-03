package com.wyq.jpa.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.wyq.jpa.model.User;

@Repository
public interface UserDao extends JpaRepository<User, Integer> {
	@Query(" select u from User u where u.username = :name")
	public User findByName(@Param("name")String userName);
}
