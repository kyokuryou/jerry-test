package com.jerry.test.storage;

import com.jerry.context.autoconfigure.ContextProperties.StorageClientType;
import com.jerry.context.storage.client.CryptoStorageClient;
import com.jerry.context.storage.client.FtpStorageClient;
import com.jerry.context.storage.client.LocalStorageClient;
import com.jerry.context.storage.client.StorageClient;
import com.jerry.context.storage.client.StorageClient.NoneStorageClient;
import com.jerry.context.storage.client.SunFtpStorageClient;
import com.jerry.context.utils.FileUtil;
import com.jerry.context.utils.LogUtil;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Random;

public class StorageClientApplication {

  // fileId = \2020-06\12\0d1b0030355d66d721417b28109c2621
  private final String fileId = "323032302D30362F31322F3064316230303330333535643636643732313431376232383130396332363231";
  // copyId = \2020-06\12\4d88c739de12d47f8007cec6d517f31f
  private final String copyId = "323032302D30362F31322F3464383863373339646531326434376638303037636563366435313766333166";

  public void createFileId() {
    StorageClient storageClient = getStorageClient();
//    try {
//      System.out.println(storageClient.parseFileId(fileId));
//      System.out.println(storageClient.parseFileId(copyId));
//    } catch (IOException e) {
//      e.printStackTrace();
//    }
  }

  /**
   * 文件正常操作
   */
  public void storage() {
    StorageClient storageClient = getStorageClient();
    try {
      boolean objectExist = storageClient.doesObjectExist(fileId);
      System.out.println("doesObjectExist：" + objectExist);
      if (!objectExist) {
        boolean putObject = storageClient.putObject(fileId, getFileBytes(), false);
        System.out.println("putObject：" + putObject);
      }

      byte[] getObject = storageClient.getObject(fileId);
      putFileBytes(getObject);
      System.out.println("getObject：1.png");

      boolean copyObject = storageClient.copyObject(fileId, copyId);
      System.out.println("copyObject:" + copyObject);

      boolean deleteObject = storageClient.deleteObject(fileId);
      System.out.println("deleteObject：" + deleteObject);
    } catch (IOException e) {
      LogUtil.error(e);
    }
  }

  /**
   * 文件覆盖操作
   */
  public void storageOverride() {
    StorageClient storageClient = getStorageClient();
    try {
      boolean objectExist = storageClient.doesObjectExist(fileId);
      System.out.println("doesObjectExist：" + objectExist);
      if (!objectExist) {
        boolean putObject1 = storageClient.putObject(fileId, getFileBytes(), false);
        System.out.println("putObject：" + putObject1);
      }
      boolean putObject2 = storageClient.putObject(fileId, getFileBytes(), true);
      System.out.println("putObject override：" + putObject2);
    } catch (IOException e) {
      LogUtil.error(e);
    }
  }

  private StorageClient getStorageClient() {
    StorageClientType clientType = StorageClientType.LOCAL;
//    SpringUtil.setProperties("storageClient?.storeType", clientType);
    switch (clientType) {
      case LOCAL:
//        SpringUtil.setProperties("storageClient?.directory", "D:/tmp/target");
        return new LocalStorageClient();
      case FTP:
//        SpringUtil.setProperties("storageClient?.directory", "/target");
        return new FtpStorageClient();
      case SUN_FTP:
//        SpringUtil.setProperties("storageClient?.directory", "/target");
        return new SunFtpStorageClient();
      case CRYPTO:
//        SpringUtil.setProperties("storageClient?.directory", "/target");
        return new CryptoStorageClient();
      default:
//        SpringUtil.setProperties("storageClient?.directory", "/");
        return new NoneStorageClient();
    }
  }

  private void putFileBytes(byte[] bytes) {
    File file = new File("D:/tmp/back/out/put.png");
    System.out.println("文件名：" + file.getPath() + "文件大小：" + bytes.length);
    FileOutputStream fileOutput = null;
    try {
      fileOutput = new FileOutputStream(file);
      FileUtil.writeStream(bytes, fileOutput);
    } catch (IOException e) {
      LogUtil.error(e);
    } finally {
      FileUtil.closeQuietly(fileOutput);
    }
  }

  private byte[] getFileBytes() {
    String[] filenames = {"1.png", "2.png", "3.png"};
    Random random = new Random();
    File file = new File("D:/tmp/back", filenames[random.nextInt(filenames.length)]);
    FileInputStream fileInput = null;
    try {
      fileInput = new FileInputStream(file);
      byte[] fileByte = FileUtil.toByteArray(fileInput);
      System.out.println("文件名：" + file.getPath() + "文件大小：" + fileByte.length);
      return fileByte;
    } catch (IOException e) {
      LogUtil.error(e);
      return new byte[0];
    } finally {
      FileUtil.closeQuietly(fileInput);
    }
  }
}
