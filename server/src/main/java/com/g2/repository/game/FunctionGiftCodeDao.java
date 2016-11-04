package com.g2.repository.game;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.g2.entity.game.FunctionGiftCode;

public interface FunctionGiftCodeDao extends PagingAndSortingRepository<FunctionGiftCode, Long>,JpaSpecificationExecutor<FunctionGiftCode>{
	
	@Modifying
	@Query("from FunctionGiftCode functionGiftCode")
	List<FunctionGiftCode> findAll();
	
}
