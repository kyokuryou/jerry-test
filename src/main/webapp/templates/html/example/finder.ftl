<#compress>
  <template>
    <div class="context-body">
      <el-row>
        <el-col :span="24">
          <el-button type="primary" @click="handleFinder">文件管理器</el-button>
          <el-button type="primary" @click="handleSave">保存</el-button>
        </el-col>
      </el-row>
      <finder ref="testFinder" :uuid="uuid" :mapping="mapping" :mapping-id="mappingId"></finder>
      <rich-input v-model="richInput" :uuid="uuid" :mapping="mapping" ></rich-input>
    </div>
  </template>
  <script>
    $.script({
      imports: ["finder", "rich-input"],
      exports: {
        data: function () {
          return {
            uuid: $.uuid(true), // 启用上传，必须
            mapping: "1000",
            mappingId: "1",
            finder: "",
            richInput: ""
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