package com.g2.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.g2.entity.Log;


public interface LogDao extends PagingAndSortingRepository<Log, Long>, JpaSpecificationExecutor<Log>{


	
}