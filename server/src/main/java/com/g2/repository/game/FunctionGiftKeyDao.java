package com.g2.repository.game;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import com.g2.entity.game.FunctionGiftKey;

public interface FunctionGiftKeyDao extends PagingAndSortingRepository<FunctionGiftKey, Long>,JpaSpecificationExecutor<FunctionGiftKey>{
	
	@Modifying
	@Query("from FunctionGiftKey functionGiftKey")
	List<FunctionGiftKey> findAll();
	
}
