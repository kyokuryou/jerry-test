<#compress>
  <template>
    <div class="context-body">
      <el-row>
        <el-col :span="24">
          <el-button type="primary" @click="handleFinder">文件管理器</el-button>
          <el-button type="primary" @click="handleSave">保存</el-button>
        </el-col>
      </el-row>
      <finder v-model="finder" ref="testFinder" :uuid="uuid" :mapping="mapping">
      </finder>
    </div>
  </template>
  <script>
    $.script({
      imports: ["finder"],
      exports: {
        data: function () {
          return {
            uuid: $.uuid(true), // 启用上传，必须
            mapping: "1000",
            finder:""
          };
        },
        methods: {
          handleFinder: function () {
            this.$refs.testFinder.open();
          },
          handleSave: function () {
            var _safe = this;
            $.http.post("/data/testFinder/modify", {uuid: _safe.uuid}, function (code, result) {
              _safe.$refs.testFinder.submit();
            })
          }
        }
      }
    })
  </script>
</#compress>