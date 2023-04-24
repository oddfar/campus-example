package com.oddfar.campus.business.task;

import com.oddfar.campus.business.service.CampusFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

/**
 * 删除信息墙没用文件定时任务
 */
@Configuration
@EnableScheduling
public class CampusFileTask {
    @Autowired
    private CampusFileService campusFileService;

    @Scheduled(cron = "0 0 */1 * * ?")
//    @Scheduled(cron = "0/5 * * * * ??")
    private void configureTasks() {
        campusFileService.removeCampusFile();
    }
}