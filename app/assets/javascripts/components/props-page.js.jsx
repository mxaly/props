import React from 'react';

import NewPropFormComponent from './props-form';
import PropsListComponent from './props-list';

import PropsStore from './../flux/props-store';
import Actions from './../flux/props-actions';

class PropsPage extends React.Component {
  constructor(props) {
    super(props);
    this.onChange = this.onChange.bind(this);
    this.onNextPage = this.onNextPage.bind(this);
    this.onPrevPage = this.onPrevPage.bind(this);

    this.state = PropsStore.getState();
  }

  componentDidMount() {
    PropsStore.listen(this.onChange);
    Actions.fetch(1);
  }

  componentWillUnmount() {
    PropsStore.unlisten(this.onChange);
  }

  onChange() {
    this.setState(PropsStore.getState());
  }

  onNextPage() {
    Actions.fetch(this.state.meta.nextPage);
  }

  onPrevPage() {
    Actions.fetch(this.state.meta.prevPage);
  }

  render() {
    return (
      <div>
        <NewPropFormComponent/>
        <PropsListComponent
          props={this.state.props}
          meta={this.state.meta}
          onNextPage={this.onNextPage}
          onPrevPage={this.onPrevPage}/>
      </div>
    );
  }
}

export default PropsPage;
