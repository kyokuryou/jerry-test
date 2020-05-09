<#compress>
  <template>
    <div class="context-body">
      <el-row>
        <el-col :span="24">
          当前上传模式：
          <el-button type="primary" @click="_changeFinderLazy">{{button.lazyText}}</el-button>
          <el-button type="primary" @click="_openFinderWindow">使用窗体打开</el-button>
        </el-col>
      </el-row>
      <el-divider></el-divider>
      <finder :uuid="finder.uuid"
              :mapping-id="finder.mappingId"
              :mapping-code="finder.mappingCode"
              :lazy="finder.lazy"
              :types="finder.types"
              @on-selection-change="_handleFinderSelection">
      </finder>
      <window ref="finderWindow" :title="window.title" width="768px"
              :modal-append-body="true"
              :append-body="false"
              @on-close="_handleFinderClose">
        <finder ref="windowFinder"
                :append-body="true"
                :uuid="finder.uuid"
                :mapping-id="finder.mappingId"
                :mapping-code="finder.mappingCode"
                :lazy="finder.lazy"
                :types="finder.types"
                @on-selection-change="_handleFinderSelection">
        </finder>
      </window>
    </div>
  </template>
  <script>
    $.script({
      imports: ['finder', 'preview'],
      exports: {
        data: function () {
          return {
            button: {
              lazyText: "延时上传"
            },
            finder: {
              uuid: $.uuid(true),
              mappingId: 1,
              mappingCode: "1000",
              lazy: true,
              types: ['image', 'video', 'pdf', 'file']
            },
            window: {
              title: "文件管理器",
              status: -1, //-1 关闭
              visible: false
            }
          };
        },
        watch: {
          "finder.lazy": function (val) {
            var _safe = this;
            if (val) {
              _safe.button.lazyText = "延时上传";
            } else {
              _safe.button.lazyText = "实时上传";
            }
          },
          "window.status": function (val, oldval) {
            var _safe = this;
            if (val === -1) {
              _safe.window.visible = false;
              _safe.$refs["finderWindow"].close();
              return;
            }
            _safe.window.visible = false;
            _safe.$refs["finderWindow"].open();
          }
        },
        methods: {
          _changeFinderLazy: function () {
            this.finder.lazy = !this.finder.lazy;
          },
          _openFinderWindow: function () {
            this.window.status = 0;
          },
          _handleFinderSelection: function (type, fileIds) {
            console.info(fileIds);
          },
          _handleFinderClose: function () {
            this.$refs["windowFinder"].clearSelection();
            this.window.status = -1;
          }
        }
      }
    })
  </script>
</#compress>