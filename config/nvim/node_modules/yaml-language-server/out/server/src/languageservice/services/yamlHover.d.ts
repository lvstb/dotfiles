import { Hover, Position } from 'vscode-languageserver-types';
import { LanguageSettings } from '../yamlLanguageService';
import { YAMLSchemaService } from './yamlSchemaService';
import { TextDocument } from 'vscode-languageserver-textdocument';
export declare class YAMLHover {
    private shouldHover;
    private schemaService;
    constructor(schemaService: YAMLSchemaService);
    configure(languageSettings: LanguageSettings): void;
    doHover(document: TextDocument, position: Position, isKubernetes?: boolean): Promise<Hover | null>;
    private getHover;
}
