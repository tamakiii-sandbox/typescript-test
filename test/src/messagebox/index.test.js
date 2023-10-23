import React from 'react';
import * as assert from 'power-assert'
import { shallow } from 'enzyme';

import MessageBox from '../../../src/messagebox';

describe('<MessageBox>', () => {
    it('renders textare', () => {
        const wrapper = shallow(<MessageBox />);
        const actual = wrapper.find('section')
        assert.equal(actual.length, 1)
    })
})