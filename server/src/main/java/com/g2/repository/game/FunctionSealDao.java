package com.g2.repository.game;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.g2.entity.game.FunctionSeal;

public interface FunctionSealDao extends PagingAndSortingRepository<FunctionSeal, Long>,JpaSpecificationExecutor<FunctionSeal>{
	
	@Modifying
	@Query("from FunctionSeal functionSeal where functionSeal.status='1'")
	List<FunctionSeal> findAll();

	FunctionSeal findByUserId(String userId);
	
}
