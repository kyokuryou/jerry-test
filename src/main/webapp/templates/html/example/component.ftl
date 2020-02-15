<#compress>
  <template>
    <div class="context-body">
      <el-tabs value="ele" tab-position="left" style="height: 100%">
        <el-tab-pane label="Element" name="ele">
          <el-link href="https://element.eleme.cn/2.13" target="_blank">官方组件V2.13.0</el-link>
          <p>属性：</p>
          <data-grid :lazy="false" :data="data.ele.props">
            <template slot="columns">
              <el-table-column label="属性" prop="prop"></el-table-column>
              <el-table-column label="值" prop="value"></el-table-column>
              <el-table-column label="说明" prop="remark"></el-table-column>
            </template>
          </data-grid>
          <p>布局：</p>
          <data-grid :lazy="false" :data="data.ele.layout">
            <template slot="columns">
              <el-table-column label="属性" prop="prop"></el-table-column>
              <el-table-column label="参考值" prop="value"></el-table-column>
              <el-table-column label="说明" prop="remark"></el-table-column>
            </template>
          </data-grid>
        </el-tab-pane>
        <el-tab-pane label="组件" name="component">
          <el-tabs value="dataGrid">
            <template v-for="cp in components">
              <el-tab-pane :label="cp.label" :name="cp.id">
                <p>组件名：{{cp.name}}</p>
                <div v-if="data.component[cp.id].props">
                  <p>属性：</p>
                  <div style="height: 200px">
                    <data-grid :lazy="false" :data="data.component[cp.id].props">
                      <template slot="columns">
                        <el-table-column label="属性" prop="prop"></el-table-column>
                        <el-table-column label="类型" prop="type"></el-table-column>
                        <el-table-column label="默认值" prop="value"></el-table-column>
                        <el-table-column label="说明" prop="remark"></el-table-column>
                      </template>
                    </data-grid>
                  </div>
                </div>
                <div v-if="data.component[cp.id].events">
                  <p>事件：</p>
                  <div style="height: 200px">
                    <data-grid :lazy="false" :data="data.component[cp.id].events">
                      <template slot="columns">
                        <el-table-column label="属性" prop="prop"></el-table-column>
                        <el-table-column label="默认值" prop="params"></el-table-column>
                        <el-table-column label="说明" prop="remark"></el-table-column>
                      </template>
                    </data-grid>
                  </div>
                </div>
                <div v-if="data.component[cp.id].methods">
                  <p>方法：</p>
                  <div style="height: 200px">
                    <data-grid :lazy="false" :data="data.component[cp.id].methods">
                      <template slot="columns">
                        <el-table-column label="属性" prop="prop"></el-table-column>
                        <el-table-column label="默认值" prop="params"></el-table-column>
                        <el-table-column label="说明" prop="remark"></el-table-column>
                      </template>
                    </data-grid>
                  </div>
                </div>
                <div v-if="data.component[cp.id].columns">
                  <p>列属性(columns)：</p>
                  <div style="height: 200px">
                    <data-grid :lazy="false" :data="data.component[cp.id].columns">
                      <template slot="columns">
                        <el-table-column label="属性" prop="prop"></el-table-column>
                        <el-table-column label="类型" prop="type"></el-table-column>
                        <el-table-column label="默认值" prop="value"></el-table-column>
                        <el-table-column label="说明" prop="remark"></el-table-column>
                      </template>
                    </data-grid>
                  </div>
                </div>
                <div v-if="data.component[cp.id].slots">
                  <p>插槽：</p>
                  <div style="height: 200px">
                    <data-grid :lazy="false" :data="data.component[cp.id].slots">
                      <template slot="columns">
                        <el-table-column label="名称" prop="name"></el-table-column>
                        <el-table-column label="属性" prop="props"></el-table-column>
                        <el-table-column label="说明" prop="remark"></el-table-column>
                      </template>
                    </data-grid>
                  </div>
                </div>
              </el-tab-pane>
            </template>
          </el-tabs>
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
                    remark: "加载数据，lazy=true时生效，\n" +
                        "params:分页启用时{pageNumber: 当前页码,pageSize: 分页大小, pageCount: 页数,total: 总数,sort:排序字段名,order:排序方式（asc/desc）}。\n"
                        +
                        "params:分页禁用时{sort:排序字段名,order:排序方式（asc/desc）}。\n" +
                        "success:Function(data)," +
                        "数据格式分页启用时{rows:[数据],pageNumber: 当前页码,pageSize: 分页大小, pageCount: 页数,total: 总数,sort:排序字段名,order:排序方式（asc/desc）}\n"
                        +
                        "数据格式分页禁用时[]\n" +
                        "done:Function()完成方法。\n"
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
                    remark: "当表格的排序条件发生变化的时候会触发该事件order{sort:排序字段名,order:排序方式（asc/desc）}，lazy为false时生效。",
                    params: "order"
                  }, {
                    prop: "on-filter-change",
                    remark: "当表格的筛选条件发生变化的时候会触发该事件，参数的值是一个对象，对象的 key 是 column 的 columnKey，对应的 value 为用户选择的筛选条件的数组，lazy为false时生效。",
                    params: "filter"
                  }, {
                    prop: "on-pagination-change",
                    remark: "分页发生变化事件，pagination为true且lazy为false时生效，{pageNumber: 当前页码,pageSize: 分页大小, pageCount: 页数,total: 总数}。",
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
                    remark: "单元格内容, $edit编辑状态打开时为true，列的类型属性为'index'/'selection'/'expand'生效",
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
                    prop: "mapping",
                    type: "string",
                    value: "-",
                    remark: "必须，与finder.mapping值对应。"
                  }, {
                    prop: "mapping-id",
                    type: "string",
                    value: "-",
                    remark: "lazy为true 必须，与finder.mappingId值对应。"
                  }],
                  events: [{
                    prop: "on-open",
                    remark: "打开动画结束时事件。",
                    params: "-"
                  }, {
                    prop: "on-close",
                    remark: "关闭动画结束时事件。",
                    params: "-"
                  }, {
                    prop: "on-confirm",
                    remark: "确认按钮点击时事件。",
                    params: "-"
                  }],
                  methods: [{
                    prop: "open",
                    remark: "打开。",
                    params: "-"
                  }, {
                    prop: "close",
                    remark: "关闭。",
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
                    value: "image",
                    remark: "预览资源类型，image/video/pdf。"
                  }],
                  events: [{
                    prop: "on-close",
                    remark: "关闭事件。",
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
                    prop: "width",
                    type: "String",
                    value: "1000px",
                    remark: "RichInput 的高度，默认为1000px宽度。如果 height 为 number 类型，单位 px；如果 height 为 string 类型，则这个高度会设置为 Table 的 style.height 的值，Table 的高度会受控于外部样式。。"
                  }],
                  events: [{
                    prop: "",
                    remark: "。",
                    params: ""
                  }],
                  methods: [{
                    prop: "",
                    remark: "。",
                    params: "-"
                  }],
                  slots: [{
                    name: "",
                    remark: "",
                    props: "-"
                  }]
                },
                selectGrid: {
                  props: [{
                    prop: "",
                    type: "",
                    value: "-",
                    remark: "。"
                  }],
                  events: [{
                    prop: "",
                    remark: "。",
                    params: ""
                  }],
                  methods: [{
                    prop: "",
                    remark: "。",
                    params: "-"
                  }],
                  slots: [{
                    name: "",
                    remark: "",
                    props: "-"
                  }]
                },
                selectIcon: {
                  props: [{
                    prop: "",
                    type: "",
                    value: "-",
                    remark: "。"
                  }],
                  events: [{
                    prop: "",
                    remark: "。",
                    params: ""
                  }],
                  methods: [{
                    prop: "",
                    remark: "。",
                    params: "-"
                  }],
                  slots: [{
                    name: "",
                    remark: "",
                    props: "-"
                  }]
                },
                selectTree: {
                  props: [{
                    prop: "",
                    type: "",
                    value: "-",
                    remark: "。"
                  }],
                  events: [{
                    prop: "",
                    remark: "。",
                    params: ""
                  }],
                  methods: [{
                    prop: "",
                    remark: "。",
                    params: "-"
                  }],
                  slots: [{
                    name: "",
                    remark: "",
                    props: "-"
                  }]
                }
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