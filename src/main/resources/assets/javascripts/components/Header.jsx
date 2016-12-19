import React from 'react';
import UserActions from '../actions/UserActions';
import UserStore from '../stores/UserStore';

// State actions
function getStateFromStore() {
  return {
    user: UserStore.getCurrentUser()
  };
}

let Header = React.createClass({
  displayName: 'Header',

  getInitialState() {
    return getStateFromStore();
  },

  componentDidMount() {
    UserStore.listen(this._onChange);
    UserActions.fetchCurrentUser();
  },

  componentWillUnmount() {
    UserStore.unlisten(this._onChange);
  },

  render() {
    return (
      <header className='flex flex-row'>
        <div className='flex'>
          <h4 className='brand'>Jumbo</h4>
        </div>
        <div className='flex justify-flex-end menu'>
          <div className='flex flex-initial'>
            <i className='glyphicon glyphicon-user' />
            {this.state.user.name}
          </div>
          <div className='flex flex-initial permissions'>
            <i className='glyphicon glyphicon-lock' />
            {this.state.user.executionPermissions.accessLevel}
          </div>
          <div className='flex flex-initial permissions'>
            <a href="/logout">
              <i className='glyphicon glyphicon-off' />
              Logout
            </a>
          </div>
        </div>
      </header>
    );
  },

    onLogoutClick: function (event) {
        window.location.href = "/logout";
    },

  /* Store events */
  _onChange() {
    this.setState(getStateFromStore());
  }
});

export default Header;
