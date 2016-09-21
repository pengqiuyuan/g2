package com.g2.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.g2.entity.Server;


public interface ServerDao extends PagingAndSortingRepository<Server, Long>,JpaSpecificationExecutor<Server>{

	Server findByServerId(String serverId);
	
	@Modifying
	@Query("from Server server where server.status='1'")
	List<Server> findAll();
}
