<#compress>
  <template>
    <div class="context-body">
      <el-row>
        <el-col :span="24">
        </el-col>
      </el-row>
      <data-grid ref="testGrid" pagination :columns="columns" :loader="handleLoader">
        <template slot="icon" slot-scope="scope">
          <i :class="scope.$value"></i>
        </template>
        <template slot="typeNames" slot-scope="scope">
          <span>{{scope.$value.join()}}</span>
        </template>
        <template slot="operate" slot-scope="scope">
          <el-button type="text" size="small" @click="handleDetail(scope.row.id)">查看
          </el-button>
          <el-button type="text" size="small" @click="handleEdit(scope.row.id)">编辑
          </el-button>
          <el-button type="text" size="small" @click="handleDelete(scope.row.id)">删除
          </el-button>
        </template>
      </data-grid>

      <window ref="testWindow" :title="window.title"
              width="1000px"
              @on-close="handleClose">
        <el-form :model="window.form" :rules="window.rules" ref="testForm"
                 label-width="100px" label-suffix="：">
          <el-form-item label="活动名称" prop="name">
            <el-input v-model="window.form.name"></el-input>
          </el-form-item>
          <el-form-item label="活动图标" prop="icon">
            <select-icon v-model="window.form.icon"></select-icon>
          </el-form-item>
          <el-form-item label="活动区域" prop="region">
            <select-tree v-model="window.form.region"
                         :leaf-only="window.region.leafOnly"
                         :data="window.region.data">
            </select-tree>
          </el-form-item>
          <el-form-item label="活动性质" prop="type">
            <select-grid v-model="window.form.type" multiple show-column="name"
                         :columns="window.type.columns" :data="window.type.rows">
            </select-grid>
          </el-form-item>
          <el-form-item label="活动形式" prop="desc">
            <rich-input v-model="window.form.desc"
                        :uuid="window.finder.uuid"
                        :mapping-code="window.finder.mappingCode"
                        :mapping-id="window.finder.mappingId"
                        :modal-append-body="false"
                        :append-body="true">
            </rich-input>
          </el-form-item>
        </el-form>
        <div slot="footer">
          <el-button type="primary" :loading="window.loading" @click="handleSave">
            <@spring.message code="ui.operate.save"/>
          </el-button>
          <el-button @click="handleClose">
            <@spring.message code="ui.operate.close"/>
          </el-button>
        </div>
      </window>
      <drawer ref="testDrawer" :title="drawer.title"
              size="30%"
              @on-close="handleClose">
        <el-form label-width="100px" label-suffix="：">
          <el-form-item label="活动名称">
            <span>{{drawer.form.name}}</span>
          </el-form-item>
          <el-form-item label="活动图标">
            <span>{{drawer.form.icon}}</span>
          </el-form-item>
          <el-form-item label="活动区域">
            <span>{{drawer.form.regionName}}</span>
          </el-form-item>
          <el-form-item label="活动性质">
            <span>{{drawer.form.typeNames?drawer.form.typeNames.join():""}}</span>
          </el-form-item>
          <el-form-item label="活动形式">
            <div v-html="drawer.form.desc"></div>
          </el-form-item>
        </el-form>
        <div slot="footer">
          <el-button @click="handleClose">
            <@spring.message code="ui.operate.close"/>
          </el-button>
        </div>
      </drawer>
    </div>
  </template>
  <script>
    $.script({
      imports: [
        "window", "drawer",
        "data-grid",
        "rich-input", "select-grid", "select-icon", "select-tree"
      ],
      exports: {
        data: function () {
          var _safe = this;
          return {
            drawer: {
              loading: false,
              title: "",
              status: -1,
              refs: {0: "testDrawer"},
              form: {}
            },
            window: {
              loading: false,
              title: "",
              status: -1, //-1关闭,0新增,1编辑;新增编辑一样就用一个,不一样再使用两个
              refs: {0: "testWindow", 1: "testWindow"},
              rules: {
                name: [
                  {required: true, message: '请输入名称', trigger: 'blur'},
                  {min: 2, max: 25, message: '长度在 2 到 25 个字符', trigger: 'blur'}
                ],
                icon: [
                  {required: true, message: '请选择图标', trigger: 'change'}
                ],
                region: [
                  {required: true, message: '请选择区域', trigger: 'change'}
                ],
                type: [
                  {required: true, type: 'array', message: '请选择性质', trigger: 'change'}
                ],
                desc: [
                  {required: true, message: '请输入形式', trigger: 'change'}
                ]
              },
              form: {},
              extend: {},
              finder: {
                // 启用上传，必须
                uuid: $.uuid(true),
                mappingId: 0,
                mappingCode: 1000
              },
              region: {
                leafOnly: true,
                data: [{
                  id: 1,
                  label: "北京市",
                  isLeaf: true
                }, {
                  id: 2,
                  label: "上海市",
                  isLeaf: true
                }, {
                  id: 3,
                  label: "辽宁省",
                  children: [{
                    id: 4,
                    label: "沈阳市",
                    isLeaf: true
                  }, {
                    id: 5,
                    label: "大连市",
                    isLeaf: true
                  }]
                }]
              },
              type: {
                columns: [
                  {type: "index", fixed: true, align: "center"},
                  {label: "性质名称", prop: "name"}
                ],
                rows: [
                  {id: 1, name: "美食/餐厅线上活动"},
                  {id: 2, name: "地推活动"},
                  {id: 3, name: "线下主题活动"},
                  {id: 4, name: "单纯品牌曝光"}
                ]
              }
            },
            columns: [
              {type: "index", fixed: true, align: "center"},
              {label: "活动名称", prop: "name", width: 150},
              {label: "活动图标", prop: "icon", width: 150},
              {label: "活动区域", prop: "regionName"},
              {label: "活动性质", prop: "typeNames"},
              {label: "操作", prop: "operate", fixed: "right", width: '150px', align: "center"}
            ],
            rows: [{
              id: 1,
              name: "张三活动",
              icon: "icofont-bird-wings",
              region: 1,
              type: [1],
              regionName: "北京",
              typeNames: ["美食/餐厅线上活动"],
              desc: "&lt;p&gt;sdfsdfsdfsdf&lt;/p&gt;&lt;p&gt;sdfsfsdfsdf&lt;/p&gt;"
            }, {
              id: 2,
              name: "李四活动",
              icon: "icofont-bow",
              region: 2,
              type: [2, 3],
              regionName: "上海",
              typeNames: ["地推活动", "线下主题活动"],
              desc: "&lt;p&gt;sdfsdfsdfsdf&lt;/p&gt;&lt;p&gt;sdfsfsdfsdf&lt;/p&gt;"
            }]
          };
        },
        watch: {
          "window.status": function (val, oldval) {
            var _safe = this;
            if (val === -1) {
              var _cw = _safe.$refs[_safe.window.refs[oldval]];
              if (_cw) {
                _safe.window.title = "";
                _safe.window.form = {};
                _safe.window.extend = {};
                _safe.window.finder.mappingId = 0;
                _cw.close();
              }
              return;
            }
            var _ow = _safe.$refs[_safe.window.refs[val]];
            if (_ow) {
              if (val === 0) {
                _safe.window.title = '<@spring.message code="ui.operate.create"/>';
              } else if (val === 1) {
                _safe.window.title = '<@spring.message code="ui.operate.modify"/>';
              }
              _ow.open();
            }
          },
          "drawer.status": function (val, oldval) {
            var _safe = this;
            if (val === -1) {
              var _cw = _safe.$refs[_safe.drawer.refs[oldval]];
              if (_cw) {
                _safe.drawer.title = "";
                _safe.drawer.form = {};
                _cw.close();
              }
              return;
            }
            var _ow = _safe.$refs[_safe.drawer.refs[val]];
            if (_ow) {
              _ow.open();
            }
          }
        },
        methods: {
          handleLoader: function (params, success, done) {
            var _safe = this;
            var result = {
              pageNumber: 1,
              pageSize: 20,
              pageCount: 1,
              total: 2,
              sort: "create_time",
              order: "desc",
              rows: _safe.rows
            };
            setTimeout(function () {
              success(result);
              done();
            }, 1000);
          },
          handleEdit: function (id) {
            var _safe = this;
            var _item = _safe.rows.find(function (value) {
              return value.id === id;
            });
            setTimeout(function () {
              _safe.window.form = {
                id: _item.id,
                name: _item.name,
                icon: _item.icon,
                region: _item.region,
                type: _item.type,
                desc: _item.desc
              };
              _safe.window.extend = {
                regionName: _item.regionName,
                typeNames: _item.typeNames
              };
              _safe.window.finder.mappingId = _item.id;
              _safe.window.status = 1;
            }, 100);
          },
          handleDetail: function (id) {
            var _safe = this;
            var _item = _safe.rows.find(function (value) {
              return value.id === id;
            });
            setTimeout(function () {
              _safe.drawer.form = {
                name: _item.name,
                icon: _item.icon,
                regionName: _item.regionName,
                typeNames: _item.typeNames,
                desc: $.escape.html(_item.desc)
              };
              _safe.drawer.status = 0;
              _safe.drawer.title = _item.name;
            }, 100);
          },
          handleDelete: function (id) {
            var _safe = this;
            $.msg.confirm("确定要删除？").done(function () {
              var _index = _safe.rows.findIndex(function (value) {
                return value.id === id;
              });
              _safe.rows.splice(_index, 1);
            });
          },
          handleSave: function () {
            var _safe = this;
            var _form = $.extend({}, _safe.window.form);
            var _index = _safe.rows.findIndex(function (value) {
              return value.id === _form.id;
            });
            _form["typeNames"] = _form.type.map(function (type) {
              var row = _safe.window.type.rows.find(function (typeRows) {
                return typeRows.id === type;
              });
              return row.name;
            });
            _form["regionName"] = _safe.window.region.data.find(function (data) {
              return data.id === _form.region;
            }).label;
            _safe.rows.splice(_index, 1, _form);
            _safe.window.status = -1;
          },
          handleClose: function () {
            this.drawer.status = -1;
            this.window.status = -1;
          }
        }
      }
    })
  </script>
</#compress>