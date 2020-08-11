<#compress>
  <template>
    <div class="context-body">
      <el-tabs value="ele" tab-position="left" style="height: 100%">
        <el-tab-pane label="Element" name="ele">
          <el-link href="https://element.eleme.cn/2.13" target="_blank">官方组件V2.13.0</el-link>
          <p>属性：</p>
          <div style="height: 200px;">
            <data-grid :lazy="false" :data="data.ele.props">
              <template slot="columns">
                <el-table-column label="属性" width="400" prop="prop"></el-table-column>
                <el-table-column label="值" width="400" prop="value"></el-table-column>
                <el-table-column label="说明" prop="remark">
                  <template slot-scope="scope">
                    <div v-html="scope.row.remark"></div>
                  </template>
                </el-table-column>
              </template>
            </data-grid>
          </div>
          <p>布局：</p>
          <div style="height: 200px;">
            <data-grid :lazy="false" :data="data.ele.layout">
              <template slot="columns">
                <el-table-column label="属性" width="400" prop="prop"></el-table-column>
                <el-table-column label="参考值" width="400" prop="value"></el-table-column>
                <el-table-column label="说明" prop="remark">
                  <template slot-scope="scope">
                    <div v-html="scope.row.remark"></div>
                  </template>
                </el-table-column>
              </template>
            </data-grid>
          </div>
        </el-tab-pane>
        <el-tab-pane label="组件" name="component">
          <el-tabs value="dataGrid">
            <template v-for="cp in components">
              <el-tab-pane :label="cp.label" :name="cp.id">
                <div style="overflow: auto;height: calc(100vh - 159px)">
                  <p>组件名：{{cp.name}}</p>
                  <div v-if="data.component[cp.id].props">
                    <p>属性：</p>
                    <div style="height: 200px">
                      <data-grid :lazy="false" :data="data.component[cp.id].props">
                        <template slot="columns">
                          <el-table-column label="属性" width="400" prop="prop"></el-table-column>
                          <el-table-column label="类型" width="400" prop="type"></el-table-column>
                          <el-table-column label="默认值" width="400" prop="value"></el-table-column>
                          <el-table-column label="说明" prop="remark">
                            <template slot-scope="scope">
                              <div v-html="scope.row.remark"></div>
                            </template>
                          </el-table-column>
                        </template>
                      </data-grid>
                    </div>
                  </div>
                  <div v-if="data.component[cp.id].events">
                    <p>事件：</p>
                    <div style="height: 200px">
                      <data-grid :lazy="false" :data="data.component[cp.id].events">
                        <template slot="columns">
                          <el-table-column label="属性" width="400" prop="prop"></el-table-column>
                          <el-table-column label="默认值" width="400" prop="params"></el-table-column>
                          <el-table-column label="说明" prop="remark">
                            <template slot-scope="scope">
                              <div v-html="scope.row.remark"></div>
                            </template>
                          </el-table-column>
                        </template>
                      </data-grid>
                    </div>
                  </div>
                  <div v-if="data.component[cp.id].methods">
                    <p>方法：</p>
                    <div style="height: 200px">
                      <data-grid :lazy="false" :data="data.component[cp.id].methods">
                        <template slot="columns">
                          <el-table-column label="名称" width="400" prop="prop"></el-table-column>
                          <el-table-column label="参数" width="400" prop="params"></el-table-column>
                          <el-table-column label="说明" prop="remark">
                            <template slot-scope="scope">
                              <div v-html="scope.row.remark"></div>
                            </template>
                          </el-table-column>
                        </template>
                      </data-grid>
                    </div>
                  </div>
                  <div v-if="data.component[cp.id].columns">
                    <p>列属性(columns)：</p>
                    <div style="height: 200px">
                      <data-grid :lazy="false" :data="data.component[cp.id].columns">
                        <template slot="columns">
                          <el-table-column label="属性" width="400" prop="prop"></el-table-column>
                          <el-table-column label="类型" width="400" prop="type"></el-table-column>
                          <el-table-column label="默认值" width="400" prop="value"></el-table-column>
                          <el-table-column label="说明" prop="remark">
                            <template slot-scope="scope">
                              <div v-html="scope.row.remark"></div>
                            </template>
                          </el-table-column>
                        </template>
                      </data-grid>
                    </div>
                  </div>
                  <div v-if="data.component[cp.id].slots">
                    <p>插槽：</p>
                    <div style="height: 200px">
                      <data-grid :lazy="false" :data="data.component[cp.id].slots">
                        <template slot="columns">
                          <el-table-column label="名称" width="400" prop="name"></el-table-column>
                          <el-table-column label="属性" width="400" prop="props"></el-table-column>
                          <el-table-column label="说明" prop="remark">
                            <template slot-scope="scope">
                              <div v-html="scope.row.remark"></div>
                            </template>
                          </el-table-column>
                        </template>
                      </data-grid>
                    </div>
                  </div>
                </div>
              </el-tab-pane>
            </template>
          </el-tabs>
        </el-tab-pane>
        <el-tab-pane label="插件" name="plugin">
          <el-tabs value="thirdParty">
            <template v-for="ps in plugins">
              <el-tab-pane :label="ps.label" :name="ps.id">
                <div style="overflow: auto;height: calc(100vh - 159px)">
                  <p>插件名：{{ps.name}}</p>
                  <div style="height: 200px;">
                    <data-grid :lazy="false" :data="data.plugin[ps.id]">
                      <template slot="columns">
                        <el-table-column label="名称" width="400" prop="prop"></el-table-column>
                        <el-table-column label="参数" width="400" prop="params"></el-table-column>
                        <el-table-column label="说明" prop="remark">
                          <template slot-scope="scope">
                            <div v-html="scope.row.remark"></div>
                          </template>
                        </el-table-column>
                      </template>
                    </data-grid>
                  </div>
                </div>
              </el-tab-pane>
            </template>
          </el-tabs>

        </el-tab-pane>
        <el-tab-pane label="脚本" name="script">
          <p>方法：</p>
          <div style="height: 200px;">
            <data-grid :lazy="false" :data="data.script.method">
              <template slot="columns">
                <el-table-column label="名称" width="400" prop="prop"></el-table-column>
                <el-table-column label="参数" width="400" prop="params"></el-table-column>
                <el-table-column label="说明" prop="remark">
                  <template slot-scope="scope">
                    <div v-html="scope.row.remark"></div>
                  </template>
                </el-table-column>
              </template>
            </data-grid>
          </div>
          <p>指令：</p>
          <div style="height: 200px;">
            <data-grid :lazy="false" :data="data.script.directive">
              <template slot="columns">
                <el-table-column label="名称" width="400" prop="prop"></el-table-column>
                <el-table-column label="参数" width="400" prop="params"></el-table-column>
                <el-table-column label="说明" prop="remark">
                  <template slot-scope="scope">
                    <div v-html="scope.row.remark"></div>
                  </template>
                </el-table-column>
              </template>
            </data-grid>
          </div>
          <p>混入：</p>
          <div style="height: 200px;">
            <data-grid :lazy="false" :data="data.script.mixins">
              <template slot="columns">
                <el-table-column label="名称" width="400" prop="prop"></el-table-column>
                <el-table-column label="参数" width="400" prop="params"></el-table-column>
                <el-table-column label="说明" prop="remark">
                  <template slot-scope="scope">
                    <div v-html="scope.row.remark"></div>
                  </template>
                </el-table-column>
              </template>
            </data-grid>
          </div>
        </el-tab-pane>
      </el-tabs>
    </div>
  </template>
  <script>
    $.script({
      imports: ["data-grid"],
      exports: {
        data: function () {
          return {
            components: [{
              id: "dataGrid",
              name: "data-grid",
              label: "数据表格"
            }, {
              id: "drawer",
              name: "drawer",
              label: "抽屉"
            }, {
              id: "window",
              name: "window",
              label: "窗体"
            }, {
              id: "finder",
              name: "finder",
              label: "文件管理器"
            }, {
              id: "preview",
              name: "preview",
              label: "预览"
            }, {
              id: "richInput",
              name: "rich-input",
              label: "富文本编辑器"
            }, {
              id: "selectGrid",
              name: "select-grid",
              label: "下拉表选择"
            }, {
              id: "selectIcon",
              name: "select-icon",
              label: "下拉图标选择"
            }, {
              id: "selectTree",
              name: "select-tree",
              label: "下拉树选择"
            }],
            plugins: [{
              id: "thirdParty",
              name: "-",
              label: "第三方"
            }, {
              id: "finder",
              name: "$.finder",
              label: "文件管理器"
            }],
            data: {
              ele: {
                props: [{
                  prop: "Vue.prototype.$ELEMENT.size",
                  value: "small",
                  remark: "-"
                }, {
                  prop: "Vue.prototype.$ELEMENT.zIndex",
                  value: "3000",
                  remark: "-"
                }, {
                  prop: "ELEMENT.locale",
                  value: "服务端国际化",
                  remark: "去除自带语言包，由服务器统一国际化"
                }],
                layout: [{
                  prop: "整体最小宽高",
                  value: "1024*768",
                  remark: "-"
                }, {
                  prop: "整体横纵滚动",
                  value: "无",
                  remark: "-"
                }, {
                  prop: "可见内容体高度",
                  value: "calc(100vh - 104px)",
                  remark: "-"
                }, {
                  prop: "可见内容体宽度",
                  value: "100%",
                  remark: "-"
                }]
              },
              component: {
                dataGrid: {
                  props: [{
                    prop: "data",
                    type: "array/object",
                    value: "-",
                    remark: "显示的数据，lazy=false时生效。"
                  }, {
                    prop: "row-style",
                    type: "Function(row, rowIndex)",
                    value: "-",
                    remark: "行的 style 的回调方法。"
                  }, {
                    prop: "cell-style",
                    type: "Function(row, column, rowIndex, columnIndex)",
                    value: "-",
                    remark: "单元格的 style 的回调方法。"
                  }, {
                    prop: "header-row-style",
                    type: "Function(row, rowIndex)",
                    value: "-",
                    remark: "表头行的 style 的回调方法。"
                  }, {
                    prop: "header-cell-style",
                    type: "Function(row, column, rowIndex, columnIndex)",
                    value: "-",
                    remark: "表头单元格的 style 的回调方法。"
                  }, {
                    prop: "lazy",
                    type: "Boolean",
                    value: "true",
                    remark: "延时加载，表格数据及树形节点，为'true'时，必须使用loader和tree-loader属性。"
                  }, {
                    prop: "row-key",
                    type: "String",
                    value: "id",
                    remark: "行数据的 Key，用来优化 Table 的渲染；在使用 reserve-selection 功能与显示树形数据时，该属性是必填的。"
                  }, {
                    prop: "default-expand-all",
                    type: "Boolean",
                    value: "false",
                    remark: "是否默认展开所有行，当 Table 包含展开行存在或者为树形表格时有效。"
                  }, {
                    prop: "expand-row-keys",
                    type: "Array",
                    value: "-",
                    remark: "可以通过该属性设置 Table 目前的展开行，需要设置 row-key 属性才能使用，该属性为展开行的 keys 数组。"
                  }, {
                    prop: "show-header",
                    type: "Boolean",
                    value: "true",
                    remark: "是否显示表头。"
                  }, {
                    prop: "tooltip-effect",
                    type: "String",
                    value: "light",
                    remark: "tooltip effect 属性。"
                  }, {
                    prop: "show-summary",
                    type: "Boolean",
                    value: "false",
                    remark: "是否在表尾显示合计行。"
                  }, {
                    prop: "sum-text",
                    type: "String",
                    value: "ui.data.sumText",
                    remark: "合计行第一列的文本。"
                  }, {
                    prop: "summary-method",
                    type: "Function( columns, data )",
                    value: "-",
                    remark: "自定义的合计计算方法。"
                  }, {
                    prop: "span-method",
                    type: "Function( row, column, rowIndex, columnIndex )",
                    value: "-",
                    remark: "合并行或列的计算方法。"
                  }, {
                    prop: "loader",
                    type: "Function( params, success, done )",
                    value: "-",
                    remark: "加载数据，lazy=true时生效。<br/>" +
                        "参数：params：<br/>" +
                        "分页启用时{pageNumber: 当前页码,pageSize: 分页大小, pageCount: 页数,total: 总数,sort:排序字段名,order:排序方式（asc/desc）}。<br/>"
                        +
                        "分页禁用时{sort:排序字段名,order:排序方式（asc/desc）}。<br/>" +
                        "参数：success:Function(data)：<br/>" +
                        "分页启用时{rows:[数据],pageNumber: 当前页码,pageSize: 分页大小, pageCount: 页数,total: 总数,sort:排序字段名,order:排序方式（asc/desc）}<br/>"
                        +
                        "分页禁用时[数据]<br/>" +
                        "done:Function()完成方法。"
                  }, {
                    prop: "tree-loader",
                    type: "Function( row.id, success, done )",
                    value: "-",
                    remark: "加载子节点数据的函数，tree 为 true 时生效，" +
                        "success:Function(data,hasChildren)," +
                        "data数据格式：array" +
                        "done:Function()完成方法。\n"
                  }, {
                    prop: "columns",
                    type: "Array",
                    value: "-",
                    remark: "列定义，见（列定义）。"
                  }, {
                    prop: "tree",
                    type: "Boolean",
                    value: "false",
                    remark: "启用树形。"
                  }, {
                    prop: "pagination",
                    type: "Boolean",
                    value: "false",
                    remark: "启用分页。"
                  }],
                  events: [{
                    prop: "on-selection-change",
                    remark: "当选择项发生变化时会触发该事件。",
                    params: "selection"
                  }, {
                    prop: "on-cell-click",
                    remark: "当某个单元格被点击时会触发该事件。",
                    params: "rowIndex, columnKey, row, column, cell, event"
                  }, {
                    prop: "on-cell-dblclick",
                    remark: "当某个单元格被双击击时会触发该事件。",
                    params: "rowIndex, columnKey, row, column, cell, event"
                  }, {
                    prop: "on-row-click",
                    remark: "当某一行被点击时会触发该事件。",
                    params: "rowIndex, row, column, event"
                  }, {
                    prop: "on-row-dblclick",
                    remark: "当某一行被点击时会触发该事件。",
                    params: "rowIndex, row, column, event"
                  }, {
                    prop: "on-row-contextmenu",
                    remark: "当某一行被点击时会触发该事件。",
                    params: "rowIndex, row, column, event"
                  }, {
                    prop: "on-header-click",
                    remark: "当某一列的表头被点击时会触发该事件。",
                    params: "column, event"
                  }, {
                    prop: "on-header-contextmenu",
                    remark: "当某一列的表头被鼠标右键点击时触发该事件。",
                    params: "column, event"
                  }, {
                    prop: "on-sort-change",
                    remark: "当表格的排序条件发生变化的时候会触发该事件order{sort:排序字段名,order:排序方式（asc/desc）}，lazy为true时自动重新加载数据。",
                    params: "order"
                  }, {
                    prop: "on-filter-change",
                    remark: "当表格的筛选条件发生变化的时候会触发该事件，参数的值是一个对象，对象的 key 是 column 的 columnKey，对应的 value 为用户选择的筛选条件的数组，lazy为true时自动重新加载数据。",
                    params: "filter"
                  }, {
                    prop: "on-pagination-change",
                    remark: "分页发生变化事件，pagination为true时生效，{pageNumber: 当前页码,pageSize: 分页大小, pageCount: 页数,total: 总数}。lazy为true时自动重新加载数据",
                    params: "pager"
                  }, {
                    prop: "on-current-row-change",
                    remark: "当表格的当前行发生变化的时候会触发该事件，如果要高亮当前行，请打开表格的 highlight-current-row 属性",
                    params: "currentRow, oldCurrentRow"
                  }],
                  methods: [{
                    prop: "getCurrentRow",
                    remark: "用于单选表格，返回某一行为选中行。",
                    params: "-"
                  }, {
                    prop: "clearSelection",
                    remark: "用于多选表格，清空用户的选择。",
                    params: "-"
                  }, {
                    prop: "clearFilter",
                    remark: "用于清空所有过滤条件，数据会恢复成未过滤的状态。",
                    params: "-"
                  }, {
                    prop: "clearSort",
                    remark: "用于清空排序条件，数据会恢复成未排序的状态。",
                    params: "-"
                  }, {
                    prop: "reset",
                    remark: "用于清空所有状态，重新加载数据。",
                    params: "-"
                  }, {
                    prop: "reload",
                    remark: "重新加载数据。",
                    params: "-"
                  }, {
                    prop: "replace",
                    remark: "替换数据。",
                    params: "rowIndex, row"
                  }, {
                    prop: "remove",
                    remark: "删除数据。",
                    params: "rowIndex"
                  }, {
                    prop: "removeById",
                    remark: "按ID删除数据。",
                    params: "id"
                  }, {
                    prop: "append",
                    remark: "追加一行可编辑数据。",
                    params: "-"
                  }, {
                    prop: "cellEdit",
                    remark: "编辑指定列。",
                    params: "rowIndex, columnKey"
                  }, {
                    prop: "rowEdit",
                    remark: "编辑指定行。",
                    params: "rowIndex"
                  }, {
                    prop: "cancelAppend",
                    remark: "取消追加。",
                    params: "-"
                  }, {
                    prop: "cancelEdit",
                    remark: "取消行/列编辑。",
                    params: "-"
                  }],
                  slots: [{
                    name: "columns",
                    remark: "列定义，优先级高于属性columns，参照el-table-column",
                    props: "-"
                  }, {
                    name: "cell.prop",
                    remark: "单元格内容定义,$value：当前单元格值，$row：当前行数据，$index：当前行索引$edit：编辑状态打开时为true。</br/>"
                        +
                        "&lt;template slot='propName' slot-scope='scope'&gt;&lt;span&gt;{{scope.$value}}&lt;/span&gt;&lt;/template&gt;",
                    props: "$value, $row, $index, $edit"
                  }],
                  columns: [{
                    prop: "type",
                    type: "string",
                    value: "-",
                    remark: "对应列的类型。如果设置了 selection 则显示多选框；如果设置了 index 则显示该行的索引（从 1 开始计算）；如果设置了 expand 则显示为一个可展开的按钮"
                  }, {
                    prop: "label",
                    type: "string",
                    value: "-",
                    remark: "显示的标题"
                  }, {
                    prop: "fixed",
                    type: "string, boolean",
                    value: "-",
                    remark: "列是否固定在左侧或者右侧，true 表示固定在左侧"
                  }, {
                    prop: "width",
                    type: "string",
                    value: "50/auto",
                    remark: "对应列的最小宽度，type为'index'/'selection'/'expand'值为50，其他为auto"
                  }, {
                    prop: "align",
                    type: "string",
                    value: "left",
                    remark: "对齐方式，left/center/right"
                  }, {
                    prop: "selectable",
                    type: "Function(row, index)",
                    value: "-",
                    remark: "仅对 type=selection 的列有效，类型为 Function，Function 的返回值用来决定这一行的 CheckBox 是否可以勾选"
                  }, {
                    prop: "reserve-selection",
                    type: "Boolean",
                    value: "-",
                    remark: "仅对 type=selection 的列有效，类型为 Boolean，为 true 则会在数据更新之后保留之前选中的数据（需指定 row-key）"
                  }, {
                    prop: "sortable",
                    type: "Boolean",
                    value: "false",
                    remark: "对应列是否可以排序，lazy为false时，需要监听 on-sort-change 事件"
                  }, {
                    prop: "filters",
                    type: "Array[{ text, value }]",
                    value: "-",
                    remark: "数据过滤的选项，数组格式，数组中的元素需要有 text 和 value 属性。"
                  }, {
                    prop: "filter-placement",
                    type: "String",
                    value: "",
                    remark: "过滤弹出框的定位,与 Tooltip 的 placement 属性相同"
                  }, {
                    prop: "filter-multiple",
                    type: "Boolean",
                    value: "true",
                    remark: "数据过滤的选项是否多选"
                  }, {
                    prop: "filter-method",
                    type: "Function(value, row, column)",
                    value: "-",
                    remark: "数据过滤使用的方法，如果是多选的筛选项，对每一条数据会执行多次，任意一次返回 true 就会显示。"
                  }, {
                    prop: "filtered-value",
                    type: "Array",
                    value: "-",
                    remark: "选中的数据过滤项，如果需要自定义表头过滤的渲染方式，可能会需要此属性。"
                  }, {
                    prop: "header-align",
                    type: "String",
                    value: "center",
                    remark: "表头对齐方式，若不设置该项，则使用表格的对齐方式，left/center/right"
                  }, {
                    prop: "prop",
                    type: "string",
                    value: "-",
                    remark: "对应列内容的字段名，也可以使用 property 属性"
                  }, {
                    prop: "show-overflow-tooltip",
                    type: "Boolean",
                    value: "false",
                    remark: "当内容过长被隐藏时显示 tooltip"
                  }]
                },
                drawer: {
                  props: [{
                    prop: "title",
                    type: "String",
                    value: "-",
                    remark: "标题。"
                  }, {
                    prop: "direction",
                    type: "String",
                    value: "rtl",
                    remark: "Drawer 打开的方向,rtl / ltr / ttb / btt。"
                  }, {
                    prop: "size",
                    type: "number/string",
                    value: "30%",
                    remark: "Drawer 窗体的大小, 当使用 number 类型时, 以像素为单位, 当使用 string 类型时, 请传入 'x%', 否则便会以 number 类型解释。"
                  }, {
                    prop: "destroy-close",
                    type: "boolean",
                    value: "true",
                    remark: "控制是否在关闭 Drawer 之后将子元素全部销毁。"
                  }, {
                    prop: "modal-append-body",
                    type: "boolean",
                    value: "true",
                    remark: "遮罩层是否插入至 body 元素上，若为 false，则遮罩层会插入至 Drawer 的父元素上。"
                  }, {
                    prop: "append-body",
                    type: "boolean",
                    value: "false",
                    remark: "Drawer 自身是否插入至 body 元素上。嵌套的 Drawer 必须指定该属性并赋值为 true。"
                  }, {
                    prop: "before-open",
                    type: "Function()",
                    value: "-",
                    remark: "打开前回调，返回false,终止打开。"
                  }, {
                    prop: "before-close",
                    type: "Function()",
                    value: "-",
                    remark: "关闭前回调，返回false,终止关闭。"
                  }, {
                    prop: "full-screen",
                    type: "boolean",
                    value: "false",
                    remark: "全屏显示。"
                  }, {
                    prop: "show-full-screen",
                    type: "boolean",
                    value: "false",
                    remark: "显示全屏按钮。"
                  }],
                  events: [{
                    prop: "on-open",
                    remark: "Drawer 打开动画结束时事件。",
                    params: "-"
                  }, {
                    prop: "on-close",
                    remark: "Drawer 关闭动画结束时事件。",
                    params: "-"
                  }, {
                    prop: "on-change-screen",
                    remark: "全屏/正常切换改变事件。full/none",
                    params: "currentScreen"
                  }],
                  methods: [{
                    prop: "open",
                    remark: "打开Drawer。",
                    params: "-"
                  }, {
                    prop: "close",
                    remark: "关闭Drawer。",
                    params: "-"
                  }],
                  slots: [{
                    name: "-",
                    remark: "Drawer 的内容。",
                    props: "-"
                  }, {
                    name: "footer",
                    remark: "Drawer 的脚。",
                    props: "-"
                  }]
                },
                window: {
                  props: [{
                    prop: "title",
                    type: "String",
                    value: "-",
                    remark: "标题。"
                  }, {
                    prop: "width",
                    type: "number/string",
                    value: "50%",
                    remark: "window 窗体的大小, 当使用 number 类型时, 以像素为单位, 当使用 string 类型时, 请传入 'x%', 否则便会以 number 类型解释。"
                  }, {
                    prop: "destroy-close",
                    type: "boolean",
                    value: "true",
                    remark: "控制是否在关闭 window 之后将子元素全部销毁。"
                  }, {
                    prop: "modal-append-body",
                    type: "boolean",
                    value: "true",
                    remark: "遮罩层是否插入至 body 元素上，若为 false，则遮罩层会插入至 Drawer 的父元素上。"
                  }, {
                    prop: "append-body",
                    type: "boolean",
                    value: "false",
                    remark: "Drawer 自身是否插入至 body 元素上。嵌套的 Drawer 必须指定该属性并赋值为 true。"
                  }, {
                    prop: "before-open",
                    type: "Function()",
                    value: "-",
                    remark: "打开前回调，返回false,终止打开。"
                  }, {
                    prop: "before-close",
                    type: "Function()",
                    value: "-",
                    remark: "关闭前回调，返回false,终止关闭。"
                  }, {
                    prop: "full-screen",
                    type: "boolean",
                    value: "false",
                    remark: "全屏显示。"
                  }, {
                    prop: "show-full-screen",
                    type: "boolean",
                    value: "false",
                    remark: "显示全屏按钮。"
                  }],
                  events: [{
                    prop: "on-open",
                    remark: "window 打开动画结束时事件。",
                    params: "-"
                  }, {
                    prop: "on-close",
                    remark: "window 关闭动画结束时事件。",
                    params: "-"
                  }, {
                    prop: "on-change-screen",
                    remark: "全屏/正常切换改变事件。full/none",
                    params: "currentScreen"
                  }],
                  methods: [{
                    prop: "open",
                    remark: "打开window。",
                    params: "-"
                  }, {
                    prop: "close",
                    remark: "关闭window。",
                    params: "-"
                  }],
                  slots: [{
                    name: "-",
                    remark: "window 的内容。",
                    props: "-"
                  }, {
                    name: "footer",
                    remark: "window 的脚。",
                    props: "-"
                  }]
                },
                finder: {
                  props: [{
                    prop: "title",
                    type: "String",
                    value: "文件管理器",
                    remark: "标题。"
                  }, {
                    prop: "types",
                    type: "array",
                    value: "['image', 'video', 'pdf', 'file']",
                    remark: "显示文件类型，image/video/pdf/file。"
                  }, {
                    prop: "uuid",
                    type: "string",
                    value: "-",
                    remark: "本次回话唯一标示，lazy为true 必须。"
                  }, {
                    prop: "lazy",
                    type: "boolean",
                    value: "true",
                    remark: "延时上传。"
                  }, {
                    prop: "mapping-id",
                    type: "string/number",
                    value: "-",
                    remark: "必须，与finder.mappingId值对应，无值导致无法读取已存在资源。"
                  }, {
                    prop: "mapping-code",
                    type: "string/number",
                    value: "-",
                    remark: "必须，与finder.mappingCode值对应。"
                  }, {
                    prop: "append-body",
                    type: "boolean",
                    value: "false",
                    remark: "Finder 自身是否插入至 body 元素上。嵌套的 Finder 必须指定该属性并赋值为 true。"
                  }],
                  events: [{
                    prop: "on-selection-change",
                    remark: "当选择项发生变化时会触发该事件。",
                    params: "type,selection"
                  }],
                  methods: [{
                    prop: "clearSelection",
                    remark: "清空用户的选择。",
                    params: "-"
                  }, {
                    prop: "finish",
                    remark: "完成本次回话。",
                    params: "-"
                  }]
                },
                preview: {
                  props: [{
                    prop: "z-index",
                    type: "number",
                    value: "2000",
                    remark: "设置预览的 z-index。"
                  }, {
                    prop: "manual",
                    type: "boolean",
                    value: "false",
                    remark: "是否手动打开。"
                  }, {
                    prop: "url-list",
                    type: "array",
                    value: "[]",
                    remark: "预览资源地址。"
                  }, {
                    prop: "type",
                    type: "string",
                    value: "-",
                    remark: "预览资源类型，image/video/pdf。"
                  }],
                  events: [{
                    prop: "on-show",
                    remark: "显示事件。",
                    params: "-"
                  }, {
                    prop: "on-hide",
                    remark: "隐藏事件。",
                    params: "-"
                  }, {
                    prop: "on-switch",
                    remark: "切换事件。",
                    params: "-"
                  }],
                  methods: [{
                    prop: "show",
                    remark: "显示。",
                    params: "-"
                  }, {
                    prop: "hide",
                    remark: "隐藏。",
                    params: "-"
                  }]
                },
                richInput: {
                  props: [{
                    prop: "value / v-model",
                    type: "String",
                    value: "-",
                    remark: "绑定值。"
                  }, {
                    prop: "validate-event",
                    type: "boolean",
                    value: "true",
                    remark: "输入时是否触发表单的校验。"
                  }, {
                    prop: "lazy",
                    type: "boolean",
                    value: "true",
                    remark: "延时上传。"
                  }, {
                    prop: "mapping-id",
                    type: "string/number",
                    value: "-",
                    remark: "lazy为true 必须，与finder.mappingId值对应，无值导致无法读取已存在资源。"
                  }, {
                    prop: "mapping-code",
                    type: "string/number",
                    value: "-",
                    remark: "必须，与finder.mappingCode值对应。"
                  }, {
                    prop: "modal-append-body",
                    type: "boolean",
                    value: "true",
                    remark: "文件管理器是window组件，遮罩层是否插入至 body 元素上，若为 false，则遮罩层会插入至父元素上。"
                  }, {
                    prop: "append-body",
                    type: "boolean",
                    value: "false",
                    remark: "文件管理器是window组件，自身是否插入至 body 元素上。嵌套的 Drawer 必须指定该属性并赋值为 true。"
                  }, {
                    prop: "readonly",
                    type: "boolean",
                    value: "false",
                    remark: "只读模式。"
                  }, {
                    prop: "placeholder",
                    type: "string",
                    value: "ui.placeholder.input",
                    remark: "输入框占位文本。"
                  }],
                  events: [{
                    prop: "input",
                    remark: "在值改变时触发。",
                    params: "(value: string | number)"
                  }, {
                    prop: "change",
                    remark: "仅在输入框失去焦点或用户按下回车时触发。",
                    params: "(value: string | number)"
                  }, {
                    prop: "focus",
                    remark: "获得焦点时触发。",
                    params: "-"
                  }],
                  methods: [{
                    prop: "focus",
                    remark: "使 input 获取焦点。",
                    params: "-"
                  }]
                },
                selectGrid: {
                  props: [{
                    prop: "value / v-model",
                    type: "String",
                    value: "-",
                    remark: "绑定值。"
                  }, {
                    prop: "validate-event",
                    type: "boolean",
                    value: "true",
                    remark: "输入时是否触发表单的校验。"
                  }, {
                    prop: "disabled",
                    type: "boolean",
                    value: "false",
                    remark: "是否禁用。"
                  }, {
                    prop: "multiple",
                    type: "boolean",
                    value: "false",
                    remark: "选项是否多选。"
                  }, {
                    prop: "placeholder",
                    type: "string",
                    value: "ui.placeholder.select",
                    remark: "输入框占位文本。"
                  }, {
                    prop: "row-key",
                    type: "String",
                    value: "id",
                    remark: "行数据的 Key，用来优化 Table 的渲染；在使用 reserve-selection 功能与显示树形数据时，该属性是必填的。"
                  }, {
                    prop: "tooltip-effect",
                    type: "String",
                    value: "light",
                    remark: "tooltip effect 属性。"
                  }, {
                    prop: "show-column",
                    type: "string",
                    value: "-",
                    remark: "必须，显示在文本框中内容列。"
                  }, {
                    prop: "data",
                    type: "array",
                    value: "-",
                    remark: "选项数据。"
                  }, {
                    prop: "columns",
                    type: "array",
                    value: "-",
                    remark: "选项列。"
                  }],
                  events: [{
                    prop: "change",
                    remark: "仅在输入框失去焦点或用户按下回车时触发。",
                    params: "(value: string | number)"
                  }, {
                    prop: "clear",
                    remark: "在点击由 clearable 属性生成的清空按钮时触发。",
                    params: "-"
                  }, {
                    prop: "remove-tag",
                    remark: "多选模式下移除tag时触发。",
                    params: "移除的tag值"
                  }, {
                    prop: "focus",
                    remark: "当 input 获得焦点时触发。",
                    params: "(event: Event)"
                  }, {
                    prop: "blur",
                    remark: "当 input 失去焦点时触发。",
                    params: "(event: Event)"
                  }]
                },
                selectIcon: {
                  props: [{
                    prop: "value / v-model",
                    type: "String",
                    value: "-",
                    remark: "绑定值。"
                  }, {
                    prop: "validate-event",
                    type: "boolean",
                    value: "true",
                    remark: "输入时是否触发表单的校验。"
                  }, {
                    prop: "disabled",
                    type: "boolean",
                    value: "false",
                    remark: "是否禁用。"
                  }, {
                    prop: "multiple",
                    type: "boolean",
                    value: "false",
                    remark: "选项是否多选。"
                  }, {
                    prop: "placeholder",
                    type: "string",
                    value: "ui.placeholder.select",
                    remark: "输入框占位文本。"
                  }],
                  events: [{
                    prop: "change",
                    remark: "仅在输入框失去焦点或用户按下回车时触发。",
                    params: "(value: string | number)"
                  }, {
                    prop: "clear",
                    remark: "在点击由 clearable 属性生成的清空按钮时触发。",
                    params: "-"
                  }, {
                    prop: "remove-tag",
                    remark: "多选模式下移除tag时触发。",
                    params: "移除的tag值"
                  }, {
                    prop: "focus",
                    remark: "当 input 获得焦点时触发。",
                    params: "(event: Event)"
                  }, {
                    prop: "blur",
                    remark: "当 input 失去焦点时触发。",
                    params: "(event: Event)"
                  }]
                },
                selectTree: {
                  props: [{
                    prop: "value / v-model",
                    type: "String",
                    value: "-",
                    remark: "绑定值。"
                  }, {
                    prop: "validate-event",
                    type: "boolean",
                    value: "true",
                    remark: "输入时是否触发表单的校验。"
                  }, {
                    prop: "disabled",
                    type: "boolean",
                    value: "false",
                    remark: "是否禁用。"
                  }, {
                    prop: "multiple",
                    type: "boolean",
                    value: "false",
                    remark: "选项是否多选。"
                  }, {
                    prop: "placeholder",
                    type: "string",
                    value: "ui.placeholder.select",
                    remark: "输入框占位文本。"
                  }, {
                    prop: "leaf-only",
                    type: "boolean",
                    value: "true",
                    remark: "是否只选择叶子节点，默认值为 false。"
                  }, {
                    prop: "data",
                    type: "array",
                    value: "-",
                    remark: "选项数据,格式与Element UI Tree组件相同。"
                  }, {
                    prop: "props",
                    type: "object",
                    value: "{label:'label',children:'children',disabled:'disabled',isLeaf:'isLeaf'}",
                    remark: "配置选项，具体看Element UI Tree组件。"
                  }],
                  events: [{
                    prop: "change",
                    remark: "仅在输入框失去焦点或用户按下回车时触发。",
                    params: "(value: string | number)"
                  }, {
                    prop: "clear",
                    remark: "在点击由 clearable 属性生成的清空按钮时触发。",
                    params: "-"
                  }, {
                    prop: "remove-tag",
                    remark: "多选模式下移除tag时触发。",
                    params: "移除的tag值"
                  }, {
                    prop: "focus",
                    remark: "当 input 获得焦点时触发。",
                    params: "(event: Event)"
                  }, {
                    prop: "blur",
                    remark: "当 input 失去焦点时触发。",
                    params: "(event: Event)"
                  }]
                }
              },
              plugin: {
                thirdParty: [{
                  prop: "pdf",
                  params: "-",
                  remark: "版本号:2.2.228<a target='_blank' href='http://mozilla.github.io/pdf.js/'>官网</a>"
                },{
                  prop: "charts",
                  params: "-",
                  remark: "版本号:2.9.3<a target='_blank' href='https://https://www.chartjs.org/'>官网</a>"
                },{
                  prop: "contextMenu",
                  params: "-",
                  remark: "版本号:2.9.0<a target='_blank' href='http://swisnl.github.io/jQuery-contextMenu/'>官网</a>"
                },{
                  prop: "froala",
                  params: "-",
                  remark: "版本号:3.0.5<a target='_blank' href='https://www.froala.com/wysiwyg-editor'>官网</a>"
                },{
                  prop: "ui-position",
                  params: "-",
                  remark: "版本号:1.12.1<a target='_blank' href='http://jqueryui.com'>官网</a>"
                }],
                finder: [{
                  prop: "$.finder.validateFile",
                  params: "file",
                  remark: "验证文件大小是否合格"
                }, {
                  prop: "$.finder.isTempFile",
                  params: "object",
                  remark: "验证数据是否时临时文件"
                }, {
                  prop: "$.finder.pdf",
                  params: "string",
                  remark: "解析pdf文件，返回$.Deferred对象，done参数{<br/>" +
                      "total:number, // 返回pdf总页数 <br/>" +
                      "canvas:function(num), // 返回base64URL，num不指定时返回全部base64URL数组<br/>" +
                      "svg:function(num), // 返回svg，num不指定时返回全部svg对象数组<br/>" +
                      "destroy:function() // 销毁pdf<br/>" +
                      "}"
                }, {
                  prop: "$.finder.preview",
                  params: "string, time",
                  remark: "返回指定标记的预览地址"
                }, {
                  prop: "$.finder.tempUpload",
                  params: "object,callback",
                  remark: "上传临时文件，不保存磁盘，参数：{uuid,mappingCode,file:file对象或带http|https|ftp地址的字符串}callback:{beforeSend,done,fail,always}参照$.Deferred"
                }, {
                  prop: "$.finder.tempReplace",
                  params: "object,callback",
                  remark: "替换已上传临时文件，不保存磁盘，参数：{uuid,fileId,file:file}callback:{beforeSend,done,fail,always}参照$.Deferred"
                }, {
                  prop: "$.finder.list",
                  params: "object,callback",
                  remark: "文件列表，不包含临时文件，参数：{mappingCode,mappingId}callback:{beforeSend,done,fail,always}参照$.Deferred"
                }, {
                  prop: "$.finder.download",
                  params: "number|string",
                  remark: "下载文件，临时文件时参数是mark"
                }, {
                  prop: "$.finder.delete",
                  params: "number|string,callback",
                  remark: "删除文件，临时文件时参数是mark，参数：callback:{beforeSend,done,fail,always}参照$.Deferred"
                }, {
                  prop: "$.finder.upload",
                  params: "object,callback",
                  remark: "上传文件并保存磁盘，参数：{mappingCode,mappingId,file:file对象或带http|https|ftp地址的字符串}callback:{beforeSend,done,fail,always}参照$.Deferred"
                }, {
                  prop: "$.finder.replace",
                  params: "object,callback",
                  remark: "替换已上传文件并保存磁盘，参数：{id,file:file对象}callback:{beforeSend,done,fail,always}参照$.Deferred"
                }]
              },
              script: {
                method: [{
                  prop: "$.script",
                  params: "object",
                  remark: "脚本定义"
                }, {
                  prop: "$.path.project",
                  params: "string",
                  remark: "通过相对路径，返回项目上下文路径"
                }, {
                  prop: "$.path.finder",
                  params: "string",
                  remark: "通过相对路径，返回文件管理路径"
                }, {
                  prop: "$.path.context",
                  params: "string",
                  remark: "通过相对路径，返回上下文路径"
                }, {
                  prop: "$.unit.file",
                  params: "number",
                  remark: "通过文件大小字节数，返回单位的允许的最大单位"
                }, {
                  prop: "$.unit.length",
                  params: "number",
                  remark: "通过长度毫米数，返回单位的允许的最大单位"
                }, {
                  prop: "$.unit.weight",
                  params: "number",
                  remark: "通过重量毫克数，返回单位的允许的最大单位"
                }, {
                  prop: "$.isEmpty",
                  params: "string|number|array|object",
                  remark: "返回true：<br/>" +
                      "string为null|undefined|''<br/>" +
                      "number为null|undefined<br/>" +
                      "array为null|undefined|length==0<br/>" +
                      "object为null|undefined|{} "
                }, {
                  prop: "$.now",
                  params: "-",
                  remark: "当前时间时间戳"
                }, {
                  prop: "$.getVariable",
                  params: "string",
                  remark: "通过url地址，返回地址上的参数"
                }, {
                  prop: "$.format",
                  params: "string,object",
                  remark: "返回替换后字符串，如：我的名字是{name}，{name:'张三'}"
                }, {
                  prop: "$.uuid",
                  params: "boolean",
                  remark: "通过参数true|false，返回有符号或无符号UUID"
                }, {
                  prop: "$.escape.html",
                  params: "string",
                  remark: "把字符串标签转义符(&lt;|&gt;)转换成html"
                }, {
                  prop: "$.escape.string",
                  params: "string",
                  remark: "把html标签转换成转义符(&lt;|&gt;)"
                }, {
                  prop: "$.entity.stringify",
                  params: "string|number|array|object",
                  remark: "把参数转换成hex字符串"
                }, {
                  prop: "$.entity.formData",
                  params: "object",
                  remark: "把参数转换成FormData对象"
                }, {
                  prop: "$.entity.parse",
                  params: "string|number|array|object",
                  remark: "把参数转换成字符串"
                }, {
                  prop: "$.pattern.letter",
                  params: "-",
                  remark: "纯字母正则表达式"
                }, {
                  prop: "$.pattern.number",
                  params: "-",
                  remark: "纯数字正则表达式"
                }, {
                  prop: "$.pattern.email",
                  params: "-",
                  remark: "电子邮件正则表达式"
                }, {
                  prop: "$.pattern.url",
                  params: "-",
                  remark: "地址正则表达式"
                }, {
                  prop: "$.pattern.uri",
                  params: "-",
                  remark: "资源相对路径正则表达式"
                }, {
                  prop: "$.msg.loading",
                  params: "document",
                  remark: "返回加载框"
                }, {
                  prop: "$.msg.alert",
                  params: "string",
                  remark: "返回提示框，Deferred"
                }, {
                  prop: "$.msg.confirm",
                  params: "string",
                  remark: "返回确认框，Deferred"
                }, {
                  prop: "$.msg.error",
                  params: "string",
                  remark: "显示错误信息"
                }, {
                  prop: "$.msg.success",
                  params: "string",
                  remark: "显示成功信息"
                }, {
                  prop: "$.msg.info",
                  params: "string",
                  remark: "显示提示信息"
                }, {
                  prop: "$.msg.warning",
                  params: "string",
                  remark: "显示警告信息"
                }, {
                  prop: "$.creator.form",
                  params: "string,string,object",
                  remark: "根据method,action,params创建表单，并插入到body中"
                }, {
                  prop: "$.mixins.http.translate",
                  params: "string",
                  remark: "根据语言类型，切换显示语言（服务器必须配置该语言）"
                }, {
                  prop: "$.http.location",
                  params: "string,object",
                  remark: "根据地址、参数，重定向。"
                }, {
                  prop: "$.http.get",
                  params: "string,object,callback",
                  remark: "根据地址、参数，发出get请求，callback:{beforeSend,done,fail,always}参照$.Deferred"
                }, {
                  prop: "$.http.post",
                  params: "string,object,callback",
                  remark: "根据地址、参数，发出post请求，callback:{beforeSend,done,fail,always}参照$.Deferred"
                }, {
                  prop: "$.http.form",
                  params: "string,object,callback",
                  remark: "根据地址、参数，发出form请求，callback:{beforeSend,done,fail,always}参照$.Deferred"
                }, {
                  prop: "$.http.export",
                  params: "string,object",
                  remark: "根据地址、参数，导出操作"
                }, {
                  prop: "$.vue",
                  params: "object",
                  remark: "根据vue参数，初始化"
                }, {
                  prop: "$.vue",
                  params: "object",
                  remark: "根据vue参数，初始化"
                }, {
                  prop: "$.vue",
                  params: "object",
                  remark: "根据vue参数，初始化"
                }, {
                  prop: "$.require.config",
                  params: "object",
                  remark: "配置{html:{base},component:{base},plugin:{base,timeout}}"
                }, {
                  prop: "$.require.js",
                  params: "url,callback",
                  remark: "加载js"
                }, {
                  prop: "$.require.css",
                  params: "url,callback",
                  remark: "加载css"
                }, {
                  prop: "$.require.html",
                  params: "url,callback",
                  remark: "加载html，并编译成vnode"
                }, {
                  prop: "$.require.component",
                  params: "url,callback",
                  remark: "加载组件"
                }, {
                  prop: "$.component.load",
                  params: "name, callback, scope",
                  remark: "通过组件名，加载组件,当scope为true时，callback参数组件，scope为false时，加载到全局vue中"
                }, {
                  prop: "$.component.onProgress",
                  params: "name",
                  remark: "加载组件时，准备好时事件"
                }, {
                  prop: "$.component.onLoad",
                  params: "name",
                  remark: "加载组件时，加载完成事件"
                }, {
                  prop: "$.plugin.load",
                  params: "name, callback",
                  remark: "通过插件名，加载插件"
                }, {
                  prop: "$.plugin.onProgress",
                  params: "name",
                  remark: "加载插件时，准备好时事件"
                }, {
                  prop: "$.plugin.onLoad",
                  params: "name",
                  remark: "加载插件时，加载完成事件"
                }],
                directive: [{
                  prop: "focus",
                  params: "boolean",
                  remark: "使标签获得焦点"
                }, {
                  prop: "outside",
                  params: "function",
                  remark: "用户点击非绑定该指令标签，任意位置时触发"
                }, {
                  prop: "append",
                  params: "document",
                  remark: "将绑定该指令的标签，追加document对象"
                }, {
                  prop: "loading",
                  params: "boolean",
                  remark: "将绑定该指令的标签，显示或隐藏loading框"
                }],
                mixins: [{
                  prop: "emitter.dispatch",
                  params: "componentName, eventName, params",
                  remark: "向父组件触发 eventName 事件"
                }, {
                  prop: "emitter.broadcast",
                  params: "componentName, eventName, params",
                  remark: "向子组件触发 eventName 事件"
                }]
              }
            }
          }
        },
        created: function () {
        },
        methods: {}
      }
    })
  </script>
</#compress>