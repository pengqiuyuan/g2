package com.g2.repository.game;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.g2.entity.game.MonitorGameConfig;;



public interface MonitorGameConfigDao extends PagingAndSortingRepository<MonitorGameConfig, Long>,JpaSpecificationExecutor<MonitorGameConfig>{
	
	@Modifying
	@Query("from MonitorGameConfig monitorGameConfig")
	List<MonitorGameConfig> findAll();

	MonitorGameConfig findByConfigKey(String configKey);
	
	@Modifying
	@Query("from MonitorGameConfig monitorGameConfig where monitorGameConfig.configKey like ?1 order by monitorGameConfig.id asc")
	List<MonitorGameConfig> findByQuery(String query);
}
