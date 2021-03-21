<#compress>
  <template>
    <div>
      <div>
        <p>是否授权：</p>
        <p><@shiro.authenticated>已登陆</@shiro.authenticated></p>
        <p><@shiro.notAuthenticated>未登陆</@shiro.notAuthenticated></p>
        <p><@shiro.guest>游客</@shiro.guest></p>
        <p>
          <@shiro.user>
            欢迎<@shiro.principal/>
          </@shiro.user>
        </p>
      </div>
      <a-divider></a-divider>
      <div>
        <p>用户信息：</p>
        <p>用户ID：<@shiro.principal property="id"/></p>
        <p>用户名：<@shiro.principal property="username"/></p>
        <p>别名：<@shiro.principal property="alias"/></p>
      </div>
      <a-divider></a-divider>
      <div>
        <p>授权方式：</p>
        <p><@shiro.withAuthorization name="ACCOUNT">使用帐号授权</@shiro.withAuthorization></p>
        <p><@shiro.withAuthorization name="ORGANIZATION">使用机构授权</@shiro.withAuthorization></p>
      </div>
      <a-divider></a-divider>
      <div>
        <p>机构类型：</p>
        <p><@shiro.withinOrganization name="PLATFORM">所属机构是平台</@shiro.withinOrganization></p>
        <p><@shiro.withinOrganization name="COMPANY">所属机构是公司</@shiro.withinOrganization></p>
        <p><@shiro.withinOrganization name="SUBCOMPANY">所属机构是子公司</@shiro.withinOrganization></p>
        <p><@shiro.withinOrganization name="DEPARTMENT">所属机构是部门</@shiro.withinOrganization></p>
      </div>
      <a-divider></a-divider>
      <div>
        <p>角色：</p>
        <p><@shiro.hasRole name="CONSOLE_SUPER_ADMIN">拥有超级管理员角色</@shiro.hasRole></p>
        <p>
          <@shiro.hasRole name="CONSOLE_SUPER_ADMIN">
            <@shiro.hasRole name="CONSOLE_728f9dd0">
            超级管理员并示例角色
            </@shiro.hasRole>
          </@shiro.hasRole>
        </p>
        <p><@shiro.hasAnyRoles names="CONSOLE_SUPER_ADMIN,CONSOLE_728f9dd0">超级管理员或示例角色</@shiro.hasAnyRoles></p>
        <p><@shiro.lacksRole name="CONSOLE_SUPER_ADMIN">不拥有超级管理员角色</@shiro.lacksRole></p>
      </div>
      <a-divider></a-divider>
      <div>
        <p>权限：</p>
        <p><@shiro.hasPermission name="CONSOLE:testFinder:modify">拥有文件管理器修改权限</@shiro.hasPermission></p>
        <p>
          <@shiro.hasPermission name="CONSOLE:account:list">
            <@shiro.hasPermission name="CONSOLE:testFinder:modify">
            拥有帐号列表并文件管理器修改权限
            </@shiro.hasPermission>
          </@shiro.hasPermission>
          </p>
        <p><@shiro.hasAnyPermissions names="CONSOLE:account:list,CONSOLE:testFinder:modify">拥有帐号列表或文件管理器修改权限</@shiro.hasAnyPermissions></p>
        <p><@shiro.lacksPermission name="CONSOLE:account:list">不拥有帐号列表权限</@shiro.lacksPermission></p>
      </div>
    </div>
  </template>
  <script>
    defmod(function (){
      return {
        data: function () {
          return {};
        },
        created: function () {
        },
        activated: function () {
          console.info("home-activated");
        },
        deactivated: function () {
          console.info("home-deactivated");
        }
      }
    })
  </script>
</#compress>