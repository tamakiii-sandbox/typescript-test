import React, { useState } from "react"
import styled from "styled-components"

const TextArea = styled.textarea`
    width: 20em;
    height: 10em;
    line-height: 1.5em;
`

const SubmitButton = styled.button`
    width: 14rem;
    padding: 10px 20px;
    font-size: 1.0em;
    padding: 10px 30px;
    background-color: #333;
    color: #fff;
    border-style: none;

`

enum Status {
    WAITING = 1,
    UPDATING = 2,
    DONE = 3,
}

export default () => {
    const [message, setMessage] = useState<string>('');
    const [status, setStatus] = useState<Status>(Status.WAITING);

    const submit = (event: React.MouseEvent<HTMLButtonElement>) => {
        setMessage('');
        setStatus(Status.UPDATING)
        setTimeout(() => { setStatus(Status.DONE); }, 1000);
        setTimeout(() => { setStatus(Status.WAITING); }, 2000);
    }

    return (
        <section>
            <div>
                <TextArea onChange={e => setMessage(e.target.value)}>{message}</TextArea>
            </div>
            <div style={{ padding: '10px 20px' }}>
                <SubmitButton onClick={submit}>Submit</SubmitButton>
            </div>
            {status == Status.UPDATING && (
                <div>Updated</div>
            )}
            {status == Status.DONE && (
                <div>Done</div>
            )}
        </section>
    )
}