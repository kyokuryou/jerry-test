package com.jerry.test.storage;

import com.jerry.context.storage.server.CryptoStorageServer;
import com.jerry.context.storage.server.StorageServer;
import com.jerry.context.utils.LogUtil;
import java.util.concurrent.Executor;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

public class StorageServerApplication {

  public void cryptoStorage() throws Exception {
    Executor executor = newExecutor();
    StorageServer storageServer = new CryptoStorageServer(executor);
    try {
      storageServer.afterPropertiesSet();
    } catch (Exception e) {
      LogUtil.error(e);
      storageServer.destroy();
    }
  }

  private Executor newExecutor() {
    ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
    executor.setQueueCapacity(25);
    executor.setCorePoolSize(5);
    executor.setMaxPoolSize(10);
    executor.setAllowCoreThreadTimeOut(true);
    executor.setKeepAliveSeconds(60);
    executor.setThreadNamePrefix("task-");
    executor.initialize();
    return executor;
  }

}
