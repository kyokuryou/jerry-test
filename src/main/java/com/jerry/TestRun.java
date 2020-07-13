package com.jerry;

import com.jerry.context.common.InputModel;
import com.jerry.context.jdbc.dialect.DatabaseId;
import java.nio.charset.Charset;
import java.sql.SQLException;
import java.util.HashMap;
import javax.sql.DataSource;
import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Hex;

public class TestRun {

  public static void main1(String[] args) throws DecoderException {
    String hex = "312c322c332c342c35";
    String ids = "1";
    String name = "kkkkk！@#¥%……&*（））——+";

    System.out.println(new String(Hex.encodeHex(ids.getBytes(Charset.forName("UTF-8")))));
    System.out.println(new String(Hex.encodeHex(name.getBytes(Charset.forName("UTF-8")))));
    InputModel model = new InputModel(new HashMap<String, Object>() {{
      put("ids", "312c322c332c34");
      put("name", "7B226964223A312C226E616D65223A227373737373227D");
    }});

    System.out.println(model.getHexList("ids", String.class));
    System.out.println(model.getHex("name", String.class, "k"));
  }

  public static void main(String[] args) throws Exception {
//    LogUtil.test();
    TestRun run = new TestRun();
    run.sdfdf();
  }

  public void sdfdf() throws InterruptedException, SQLException {
    DatabaseId did = DatabaseId.valueOf((DataSource) null);
  }

}
