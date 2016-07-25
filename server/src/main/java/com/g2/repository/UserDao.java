/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.g2.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.g2.entity.User;

public interface UserDao extends PagingAndSortingRepository<User, Long>, JpaSpecificationExecutor<User> {
	User findByLoginName(String loginName);

	
	@Query("select count(roles)  from User  where status='1' and storeId=?1 and roles=?2" )
	int countRole(String storeId, String role);
	
	List<User> findByStoreId(String storeId);
	
	@Modifying
	@Query("delete from User user where user.storeId = ?1 ")
	void deleteByStoreId(String storeId);
}
