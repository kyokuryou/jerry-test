<#compress>
  <template>
    <div>
      <p>多选</p>
      <select-icon multiple v-model="iconValues"></select-icon>
      <select-tree multiple v-model="treeValues" :data="treeData"></select-tree>
      <select-grid multiple v-model="gridValues" :data="gridData" show-column="label" :columns="gridColumns"></select-grid>
      <p>单选</p>
      <select-icon v-model="iconValue"></select-icon>
      <select-tree v-model="treeValue" :data="treeData"></select-tree>
      <select-grid v-model="gridValue" :data="gridData1" show-column="label" :columns="gridColumns"></select-grid>
      <el-button type="primary" @click="handleClick">主要按钮</el-button>
    </div>
  </template>
  <script>
    $.script({
      imports: ["rich-input", "drawer", "select-icon", "select-tree","select-grid"],
      exports: {
        data: function () {
          return {
            iconValues: ['icofont-addons'],
            treeValues: [11, 12],
            gridValues: [1],

            iconValue: 'icofont-addons',
            treeValue: 11,
            gridValue: 1,
            treeData: [
              {
                id: 1,
                label: "test1",
                children: [{id: 11, label: "test1-1"}, {id: 12, label: "test1-2"}]
              },
              {
                id: 2,
                label: "test2",
                children: [{id: 21, label: "test2-1"}, {id: 22, label: "test2-2"}]
              }
            ],
            gridColumns: [
              { prop: "id",label:"ID"},
              { prop: "label",label:"标题"}
            ],
            gridData: [
              {
                id: 1,
                label: "test1"
              },
              {
                id: 2,
                label: "test2"
              }
            ],
            gridData1: [
              {
                id: 1,
                label: "test1"
              },
              {
                id: 2,
                label: "test2"
              }
            ]
          };
        },
        created: function () {
        },
        methods: {
          handleClick: function () {
            console.info("多选=>");
            console.info(this.iconValues);
            console.info(this.treeValues);
            console.info("单选=>");
            console.info(this.iconValue);
            console.info(this.treeValue);
          }
        }
      }
    })
  </script>
</#compress>