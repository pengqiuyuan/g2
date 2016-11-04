package com.g2.repository.game;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.g2.entity.game.MonitorIssues;

public interface MonitorIssuesDao extends PagingAndSortingRepository<MonitorIssues, Long>,JpaSpecificationExecutor<MonitorIssues>{
	
	@Modifying
	@Query("from MonitorIssues monitorIssues")
	List<MonitorIssues> findAll();
}
