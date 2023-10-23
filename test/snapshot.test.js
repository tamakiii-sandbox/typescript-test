import React, { useState } from 'react'
import renderer from 'react-test-renderer'

// https://jestjs.io/docs/en/snapshot-testing
// https://github.com/facebook/jest/blob/master/examples/snapshot/__tests__/link.react.test.js

const Link = (props) => (
    <a href={props.page || '#'}>
        {props.children}
    </a>
)

it('', () => {
    const tree = renderer.create(<Link page="" />).toJSON();
    expect(tree).toMatchSnapshot();
})