$(function () {
  $.vue({
    exports: {
      data: function () {
        return {}
      },
      methods: {
        copyClipboard: function (e) {
          console.info('Action:', e.action);
          console.info('Text:', e.text);
          console.info('Trigger:', e.trigger);
        },
        ellipsisVisibleChange: function (visible) {
          console.info(visible);
        },
        alert: function () {
          $.msg.alert('This is a alert message').done(function () {
            console.info("alert close")
          });
        },
        confirm: function () {
          $.msg.confirm('This is a prompt message');
        },
        prompt: function () {
          $.msg.prompt([{
            name: "oldPass",
            tag: "a-input",
            label: "原密码",
            rules: [
              {
                required: true,
                message: '原密码不能为空',
                whitespace: true,
                trigger: 'blur'
              }
            ],
            props: {
              type: "password",
              autofocus: true
            }
          }, {
            name: "newPass",
            tag: "a-input",
            label: "新密码",
            rules: [{
              required: true,
              message: '新密码不能为空',
              whitespace: true,
              trigger: 'blur'
            }, {
              min: 6,
              message: '密码长度必须大于6位',
              whitespace: true,
              trigger: 'blur'
            }],
            props: {
              type: "password",
              placeholder: "长度在 6 到 20 个字符"
            }
          }, {
            name: "checkNewPass",
            tag: "a-input",
            label: "确认密码",
            rules: [{
              required: true,
              message: '确认密码不能为空',
              whitespace: true,
              trigger: 'blur'
            }, {
              trigger: 'blur',
              validator: function (rule, value, callback, form) {
                if (value !== form.newPass) {
                  callback(new Error("两次输入密码不一致"));
                  return;
                }
                callback();
              }
            }],
            props: {
              type: "password",
              placeholder: "长度在 6 到 20 个字符"
            }
          }]).done(function (action) {
            // action.loading(true);
            action.validate(function (valid) {
              if (valid) {
              }
            });
          }).fail(function (reason) {
            reason.hide();
          });
        },
        info: function () {
          $.msg.info('This is a info message');
        },
        success: function () {
          $.msg.success('This is a success message');
        },
        error: function () {
          $.msg.error('This is an error message');
        },
        warning: function () {
          $.msg.warning('This is a warning message');
        }
      }
    }
  });
});